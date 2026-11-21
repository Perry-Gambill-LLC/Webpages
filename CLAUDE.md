# Webpages repo

Jekyll site for Perry & Gambill LLC. See README.md for structure.

## App page translations: keep them in sync

Every app page (`_apps/<app>.md`, published at `/apps/<app>/en-us/`, with `/apps/<app>/` redirecting there) is also published in Mexican Spanish (`_apps/es-mx/<app>.md`) and Brazilian Portuguese (`_apps/pt-br/<app>.md`). Languages are listed under `translations` in `_config.yml`.

Whenever you change an English app page, or add a new one, update both translations in the same change:

1. Translate the change into es-MX and pt-BR. `ruby scripts/translations.rb` prints the `git diff` of the English changes that still need translating.
2. Keep each translation's headings in the same order with the same explicit `{#id}` as the English heading. If an English heading's ID would start with a number (e.g. `## 1. Introduction`), give it an explicit letter-first ID in the English page too (`{#introduction}`).
3. Translate `tagline`, `description` and `privacy_effective_date` (written as a local date: `14 de noviembre de 2026`, `14 de novembro de 2026`). Don't copy other front matter; translations take the icon, App Store link, support email etc. from the English page.
4. Run `ruby scripts/translations.rb stamp _apps/es-mx/<app>.md _apps/pt-br/<app>.md`, then `ruby scripts/translations.rb` must pass.

When you add or change interface text in `_layouts/app.html`, `_includes/header.html`, `_includes/footer.html` or `_includes/app-icon.html`, put the string in `_data/i18n.yml` for every language rather than hard-coding English.

Translation style:
- es-MX: Mexican Spanish, informal "tú", Mexican vocabulary (celular, computadora, correo electrónico, "la app").
- pt-BR: Brazilian Portuguese, "você", "o app".
- Use Apple's own localized names for iOS screens and settings (es-MX: Configuración, Archivos, Cuenta de Apple; pt-BR: Ajustes, Arquivos, Conta Apple).
- Leave brand and product names untranslated (Amigology, Amigology Plus, Meowza, Mr. Whiskers, iCloud Drive, App Store).
- Translate faithfully; don't add, drop or soften anything in a privacy policy.

Use Homebrew Ruby: `export PATH="/opt/homebrew/opt/ruby/bin:$PATH"`.
