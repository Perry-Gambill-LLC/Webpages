#!/usr/bin/env ruby
# frozen_string_literal: true

# Keeps translated pages in step with their English pages: each app's page
# (_apps/<app>.md), each app's Terms of Use on a platform (_terms/<platform>/<app>.md),
# and the site's own pages (home, apps list, legal: each page with a `ref`), whose
# translations are copies under a language folder (es-mx/legal.html).
#
#   ruby scripts/translations.rb                 Check every translation (exits 1 on any problem)
#   ruby scripts/translations.rb stamp FILE...   Mark translations as up to date with the current English page
#
# Each translation (_apps/<lang>/<app>.md, _terms/<platform>/<lang>/<app>.md) has
# a `source_hash` in its front matter: a fingerprint of the English page's
# translatable text (its translated front matter fields and the body) at the
# time it was translated. When the English page changes, the fingerprints no
# longer match and the check fails, showing the English changes that still need
# translating.
#
# Only run `stamp` after the translation really has been updated.
#
# The check also makes sure that every English page redirects its short URL
# (/apps/<app>/, /apps/<app>/terms/<platform>/) to the English page, has a
# translation in each of its app's languages (the `translations` in the app's
# _apps/<app>.md front matter, or else every language under `translations` in
# _config.yml) and none in any other language, that
# translations keep the English page's sections (same headings, same IDs, same
# order), that every terms page belongs to an app, and that _data/i18n.yml has
# every interface string in every language. Each of the site's own pages needs a
# copy in each language under `site_translations` in _config.yml, with the same
# element ids (links like /legal#liability rely on them).

require "digest"
require "json"
require "open3"
require "yaml"

ROOT = File.expand_path("..", __dir__)
APPS_DIR = File.join(ROOT, "_apps")
TERMS_DIR = File.join(ROOT, "_terms")

Source = Struct.new(:dir, :fields, :short_url)

# The translated front matter fields of the site's own pages.
SITE_FIELDS = %w[title description tagline].freeze

# The folders of English pages, each with the front matter fields its translations
# translate and the short URL each page redirects from.
def sources
  apps = Source.new(APPS_DIR, %w[name tagline description privacy_effective_date], ->(app) { "/apps/#{app}/" })
  terms = Dir[File.join(TERMS_DIR, "*")].select { File.directory?(_1) }.sort.map do |dir|
    platform = File.basename(dir)
    Source.new(dir, %w[description effective_date], ->(app) { "/apps/#{app}/terms/#{platform}/" })
  end
  [apps, *terms]
end

def rel(path) = path.delete_prefix("#{ROOT}/")

def parse(text)
  match = text.match(/\A---\s*\n(.*?)\n---\s*\n(.*)\z/m) or raise "no front matter"
  [YAML.safe_load(match[1]) || {}, match[2]]
end

def fingerprint(text, translated_fields)
  data, body = parse(text)
  fields = translated_fields.to_h { |key| [key, data[key].to_s] }
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
def commit_with_fingerprint(source, fields, hash)
  (git("log", "--format=%H", "--", rel(source)) || "").split.find do |sha|
    text = git("show", "#{sha}:#{rel(source)}")
    text && fingerprint(text, fields) == hash
  rescue StandardError
    false
  end
end

def config = YAML.safe_load_file(File.join(ROOT, "_config.yml"))
def languages = Array(config["translations"])
def folder(lang) = lang.downcase
def english_pages(source) = Dir[File.join(source.dir, "*.md")].sort

def site_languages = Array(config["site_translations"])

def front_matter(path)
  parse(File.read(path))[0]
rescue StandardError
  {}
end

# The site's own pages under dir, relative to it: every HTML or Markdown page with a
# `ref` in its front matter, outside the _folders (and, at the top, the language folders).
def site_pages(dir = ROOT)
  skip = site_languages.map { |lang| "#{folder(lang)}/" }
  Dir.glob("**/*.{html,md}", base: dir).sort
     .reject { |path| path.start_with?("_", "vendor/", *skip) }
     .select { |path| front_matter(File.join(dir, path))["ref"] }
end

# The element ids in a page, in order.
def ids(body) = body.scan(/\bid="([^"]+)"/).flatten

# The problem with a translation whose recorded fingerprint isn't the English page's, if it isn't.
def stale_problem(path, source, fields, recorded, current)
  return if recorded == current

  message = +"#{rel(path)}: out of date with #{rel(source)}."
  sha = commit_with_fingerprint(source, fields, recorded)
  message << if sha
               "\n    English changes to translate: git diff #{sha[0, 10]} -- #{rel(source)}"
             else
               "\n    (Couldn't find the English version it was translated from; compare the whole page.)"
             end
  message << "\n    Then: ruby scripts/translations.rb stamp #{rel(path)}"
end

# The languages an app is translated into: those under `translations` in its
# _apps/<app>.md front matter, or else every language in _config.yml.
def app_languages(app)
  page = File.join(APPS_DIR, "#{app}.md")
  listed = File.exist?(page) && parse(File.read(page))[0]["translations"]
  listed ? Array(listed) : languages
end

def check
  problems = []
  count = 0
  folders = languages.map { |lang| folder(lang) }

  Dir[File.join(APPS_DIR, "*.md")].sort.each do |page|
    (app_languages(File.basename(page, ".md")) - languages).each do |lang|
      problems << "#{rel(page)}: #{lang} is under its translations but isn't a language listed under translations in _config.yml."
    end
  end

  sources.each do |src|
    english_pages(src).each do |source|
      count += 1
      source_text = File.read(source)
      app = File.basename(source, ".md")
      short_url = src.short_url.call(app)
      unless Array(parse(source_text)[0]["redirect_from"]).include?(short_url)
        problems << "#{rel(source)}: add #{short_url} under redirect_from, so the short URL redirects to the English page."
      end
      if src.dir != APPS_DIR && !File.exist?(File.join(APPS_DIR, File.basename(source)))
        problems << "#{rel(source)}: no app page _apps/#{File.basename(source)}. The file name must be the app's."
      end
      current = fingerprint(source_text, src.fields)
      source_headings = headings(parse(source_text)[1])

      app_languages(app).each do |lang|
        path = File.join(src.dir, folder(lang), File.basename(source))
        unless File.exist?(path)
          problems << "#{rel(path)}: missing. Translate #{rel(source)} into #{lang}."
          next
        end

        data, body = parse(File.read(path))
        if (problem = stale_problem(path, source, src.fields, data["source_hash"].to_s, current))
          problems << problem
        end

        if (problem = heading_problem(source_headings, headings(body)))
          problems << "#{rel(path)}: #{problem}"
        end
      end
    end

    Dir[File.join(src.dir, "*", "*.md")].sort.each do |path|
      dir = File.basename(File.dirname(path))
      english = File.join(src.dir, File.basename(path))
      app = File.basename(path, ".md")
      if !folders.include?(dir)
        problems << "#{rel(path)}: folder #{dir}/ isn't a language listed under translations in _config.yml."
      elsif !File.exist?(english)
        problems << "#{rel(path)}: no English page #{rel(english)} to translate from."
      elsif app_languages(app).none? { |lang| folder(lang) == dir }
        problems << "#{rel(path)}: #{dir} isn't one of #{app}'s languages (translations in _apps/#{app}.md)."
      end
    end
  end

  count += check_site_pages(problems)

  strings = YAML.safe_load_file(File.join(ROOT, "_data", "i18n.yml"))
  english_keys = strings.fetch(config.fetch("lang")).keys
  [config.fetch("lang"), *languages].each do |lang|
    root = site_languages.include?(lang) ? "/#{folder(lang)}/" : "/"
    next if strings.dig(lang, "site_root") == root

    where = site_languages.include?(lang) ? "its copy of the site" : "the English site, as it isn't under site_translations in _config.yml"
    problems << "_data/i18n.yml: #{lang}'s site_root should be #{root}, #{where}."
  end
  languages.each do |lang|
    keys = (strings[lang] || {}).keys
    missing = english_keys - keys
    extra = keys - english_keys
    problems << "_data/i18n.yml: #{lang} is missing #{missing.join(', ')}" if missing.any?
    problems << "_data/i18n.yml: #{lang} has strings English doesn't: #{extra.join(', ')}" if extra.any?
  end

  if problems.empty?
    puts "Translations are up to date (#{count} English pages)."
    true
  else
    warn "Translations need attention:\n\n"
    problems.each { |problem| warn "  - #{problem}\n\n" }
    false
  end
end

# Checks the site's own pages' translations; returns how many English pages there are.
def check_site_pages(problems)
  (site_languages - languages).each do |lang|
    problems << "_config.yml: #{lang} is under site_translations but not under translations."
  end
  pages = site_pages
  pages.each do |page|
    source = File.join(ROOT, page)
    source_text = File.read(source)
    current = fingerprint(source_text, SITE_FIELDS)
    data, body = parse(source_text)

    site_languages.each do |lang|
      path = File.join(ROOT, folder(lang), page)
      unless File.exist?(path)
        problems << "#{rel(path)}: missing. Translate #{page} into #{lang}: copy it there and translate its text."
        next
      end

      translated, translated_body = parse(File.read(path))
      if translated["ref"] != data["ref"]
        problems << "#{rel(path)}: set ref: #{data['ref']}, as in #{page}, so the pages link to each other."
      end
      if (problem = stale_problem(path, source, SITE_FIELDS, translated["source_hash"].to_s, current))
        problems << problem
      end
      next if ids(translated_body) == ids(body)

      problems << "#{rel(path)}: element ids don't match #{page}'s. Keep the English ids, in the same order:\n    " +
                  ids(body).join(", ")
    end
  end

  site_languages.each do |lang|
    dir = File.join(ROOT, folder(lang))
    site_pages(dir).each do |page|
      next if pages.include?(page)

      problems << "#{rel(File.join(dir, page))}: no English page #{page} to translate from."
    end
  end
  pages.size
end

def stamp(paths)
  abort "Usage: ruby scripts/translations.rb stamp _apps/<lang>/<app>.md _terms/<platform>/<lang>/<app>.md es-mx/<page> ..." if paths.empty?

  paths.each do |arg|
    path = File.expand_path(arg, ROOT)
    site_folder = site_languages.map { |lang| File.join(ROOT, folder(lang)) }.find { |dir| path.start_with?("#{dir}/") }
    if site_folder
      source = File.join(ROOT, path.delete_prefix("#{site_folder}/"))
      fields = SITE_FIELDS
    else
      src = sources.find { _1.dir == File.dirname(File.dirname(path)) }
      abort "#{arg}: not a translation in _apps/<lang>/, _terms/<platform>/<lang>/ or a site language folder" unless src
      source = File.join(src.dir, File.basename(path))
      fields = src.fields
    end
    abort "#{arg}: no English page #{rel(source)}" unless File.exist?(source)

    hash = fingerprint(File.read(source), fields)
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
