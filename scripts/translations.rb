#!/usr/bin/env ruby
# frozen_string_literal: true

# Keeps app page translations in step with their English pages.
#
#   ruby scripts/translations.rb                 Check every translation (exits 1 on any problem)
#   ruby scripts/translations.rb stamp FILE...   Mark translations as up to date with the current English page
#
# Each translation (_apps/<lang>/<app>.md) has a `source_hash` in its front
# matter: a fingerprint of the English page's translatable text (name, tagline,
# description, privacy_effective_date and the policy itself) at the time it was
# translated. When the English page changes, the fingerprints no longer match
# and the check fails, showing the English changes that still need translating.
#
# Only run `stamp` after the translation really has been updated.
#
# The check also makes sure that every English app page has a translation in
# each language listed under `translations` in _config.yml, that translations
# keep the English page's sections (same headings, same IDs, same order), and
# that _data/i18n.yml has every interface string in every language.

require "digest"
require "json"
require "open3"
require "yaml"

ROOT = File.expand_path("..", __dir__)
APPS_DIR = File.join(ROOT, "_apps")
TRANSLATED_FIELDS = %w[name tagline description privacy_effective_date].freeze

def rel(path) = path.delete_prefix("#{ROOT}/")

def parse(text)
  match = text.match(/\A---\s*\n(.*?)\n---\s*\n(.*)\z/m) or raise "no front matter"
  [YAML.safe_load(match[1]) || {}, match[2]]
end

def fingerprint(text)
  data, body = parse(text)
  fields = TRANSLATED_FIELDS.to_h { |key| [key, data[key].to_s] }
  Digest::SHA256.hexdigest(JSON.generate(fields.merge("body" => body.strip)))[0, 12]
end

# Headings as [level, id, explicit?]. Without an explicit {#id}, kramdown makes
# the ID from the heading text (GFM rules). kramdown only accepts explicit IDs
# that start with a letter; anything else stays in the heading as plain text.
def headings(body)
  in_fence = false
  body.each_line.filter_map do |line|
    in_fence = !in_fence if line.start_with?("```", "~~~")
    next if in_fence

    m = line.match(/\A(#+)\s+(.*?)(?:\s+\{#([A-Za-z][\w:-]*)\})?\s*\z/) or next
    id = m[3] || m[2].downcase.gsub(/[^\p{Word}\- ]/, "").tr(" ", "-")
    [m[1].size, id, !m[3].nil?]
  end
end

# Why a translation's headings can't be checked against the English page, if they can't.
def heading_problem(source_headings, translated_headings)
  bad_english = source_headings.reject { |_, id, _| id.match?(/\A[A-Za-z]/) }
  if bad_english.any?
    return "the English page has headings whose IDs don't start with a letter (#{bad_english.map { _1[1] }.join(', ')}). " \
           "Give each one an explicit ID in the English page, e.g. `## 1. Introduction {#introduction}`, and use the same IDs here."
  end
  return if translated_headings.map { _1.take(2) } == source_headings.map { _1.take(2) } && translated_headings.all? { _1[2] }

  expected = source_headings.map { |level, id, _| "#{'#' * level} <translated heading> {##{id}}" }
  "sections don't match the English page. Each heading needs the English heading's ID, in the same order:\n    " +
    expected.join("\n    ")
end

def git(*args)
  out, status = Open3.capture2("git", "-C", ROOT, *args)
  status.success? ? out : nil
end

# The most recent commit whose copy of the English page has this fingerprint.
def commit_with_fingerprint(source, hash)
  (git("log", "--format=%H", "--", rel(source)) || "").split.find do |sha|
    text = git("show", "#{sha}:#{rel(source)}")
    text && fingerprint(text) == hash
  rescue StandardError
    false
  end
end

def config = YAML.safe_load_file(File.join(ROOT, "_config.yml"))
def languages = Array(config["translations"])
def folder(lang) = lang.downcase
def english_pages = Dir[File.join(APPS_DIR, "*.md")].sort

def check
  problems = []
  english = english_pages
  folders = languages.map { |lang| folder(lang) }

  english.each do |source|
    source_text = File.read(source)
    current = fingerprint(source_text)
    source_headings = headings(parse(source_text)[1])

    languages.each do |lang|
      path = File.join(APPS_DIR, folder(lang), File.basename(source))
      unless File.exist?(path)
        problems << "#{rel(path)}: missing. Translate #{rel(source)} into #{lang}."
        next
      end

      data, body = parse(File.read(path))
      recorded = data["source_hash"].to_s
      if recorded != current
        message = +"#{rel(path)}: out of date with #{rel(source)}."
        sha = commit_with_fingerprint(source, recorded)
        message << if sha
                     "\n    English changes to translate: git diff #{sha[0, 10]} -- #{rel(source)}"
                   else
                     "\n    (Couldn't find the English version it was translated from; compare the whole page.)"
                   end
        message << "\n    Then: ruby scripts/translations.rb stamp #{rel(path)}"
        problems << message
      end

      if (problem = heading_problem(source_headings, headings(body)))
        problems << "#{rel(path)}: #{problem}"
      end
    end
  end

  Dir[File.join(APPS_DIR, "*", "*.md")].sort.each do |path|
    dir = File.basename(File.dirname(path))
    if !folders.include?(dir)
      problems << "#{rel(path)}: folder #{dir}/ isn't a language listed under translations in _config.yml."
    elsif !File.exist?(File.join(APPS_DIR, File.basename(path)))
      problems << "#{rel(path)}: no English page _apps/#{File.basename(path)} to translate from."
    end
  end

  strings = YAML.safe_load_file(File.join(ROOT, "_data", "i18n.yml"))
  english_keys = strings.fetch(config.fetch("lang", "en")).keys
  languages.each do |lang|
    keys = (strings[lang] || {}).keys
    missing = english_keys - keys
    extra = keys - english_keys
    problems << "_data/i18n.yml: #{lang} is missing #{missing.join(', ')}" if missing.any?
    problems << "_data/i18n.yml: #{lang} has strings English doesn't: #{extra.join(', ')}" if extra.any?
  end

  if problems.empty?
    puts "Translations are up to date (#{english.size} apps × #{languages.size} languages)."
    true
  else
    warn "Translations need attention:\n\n"
    problems.each { |problem| warn "  - #{problem}\n\n" }
    false
  end
end

def stamp(paths)
  abort "Usage: ruby scripts/translations.rb stamp _apps/<lang>/<app>.md ..." if paths.empty?

  paths.each do |arg|
    path = File.expand_path(arg, ROOT)
    source = File.join(APPS_DIR, File.basename(path))
    abort "#{arg}: not a translation in _apps/<lang>/" unless File.dirname(File.dirname(path)) == APPS_DIR
    abort "#{arg}: no English page #{rel(source)}" unless File.exist?(source)

    hash = fingerprint(File.read(source))
    text = File.read(path)
    abort "#{arg}: add a `source_hash:` line to its front matter first" unless text.match?(/^source_hash:.*$/)

    File.write(path, text.sub(/^source_hash:.*$/, "source_hash: #{hash}"))
    puts "#{rel(path)}: marked as up to date with #{rel(source)} (#{hash})"
  end
end

case ARGV.first
when nil, "check" then exit(check ? 0 : 1)
when "stamp" then stamp(ARGV.drop(1))
else abort "Usage: ruby scripts/translations.rb [check | stamp FILE...]"
end
