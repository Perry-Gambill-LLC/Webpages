# Webpages repo

Jekyll site for Perry & Gambill LLC. See README.md for structure.

## App page translations: keep them in sync

Every app page (`_apps/<app>.md`, published at `/apps/<app>/en-us/`, with `/apps/<app>/` redirecting there) is also published in Mexican Spanish (`_apps/es-mx/<app>.md`), Brazilian Portuguese (`_apps/pt-br/<app>.md`) and Vietnamese (`_apps/vi-vn/<app>.md`). Languages are listed under `translations` in `_config.yml`.

Whenever you change an English app page, or add a new one, update every translation in the same change:

1. Translate the change into es-MX, pt-BR and vi-VN. `ruby scripts/translations.rb` prints the `git diff` of the English changes that still need translating.
2. Keep each translation's headings in the same order with the same explicit `{#id}` as the English heading. If an English heading's ID would start with a number (e.g. `## 1. Introduction`), give it an explicit letter-first ID in the English page too (`{#introduction}`).
3. Translate `tagline`, `description` and `privacy_effective_date` (written as a local date: `14 de noviembre de 2026`, `14 de novembro de 2026`, `ngày 14 tháng 11 năm 2026`). Don't copy other front matter; translations take the icon, App Store link, support email etc. from the English page.
4. Run `ruby scripts/translations.rb stamp _apps/es-mx/<app>.md _apps/pt-br/<app>.md _apps/vi-vn/<app>.md`, then `ruby scripts/translations.rb` must pass.

The same goes for an app's Terms of Use on Android (`_terms/android/<app>.md`, translated in `_terms/android/es-mx/`, `_terms/android/pt-br/` and `_terms/android/vi-vn/`): its translated front matter is `description` and `effective_date`, and you stamp the files under `_terms/android/<lang>/`. Apple's standard EULA covers the iPhone apps; Android terms are our own, so keep them consistent with what the Android app actually does.

When you add or change interface text in `_layouts/app.html`, `_layouts/terms.html`, `_includes/header.html`, `_includes/footer.html`, `_includes/lang-switch.html` or `_includes/app-icon.html`, put the string in `_data/i18n.yml` for every language rather than hard-coding English.

Translation style:
- es-MX: Mexican Spanish, informal "tú", Mexican vocabulary (celular, computadora, correo electrónico, "la app").
- pt-BR: Brazilian Portuguese, "você", "o app".
- vi-VN: Vietnamese, addressing the reader as "bạn", "ứng dụng" for app.
- Use Apple's own localized names for iOS screens and settings (es-MX: Configuración, Archivos, Cuenta de Apple; pt-BR: Ajustes, Arquivos, Conta Apple; vi-VN: Cài đặt, Tệp, Tài khoản Apple).
- Leave brand and product names untranslated (Amigology, Amigology Plus, Meowza, Mr. Whiskers, iCloud Drive, App Store).
- Translate faithfully; don't add, drop or soften anything in a privacy policy or terms of use.

Use Homebrew Ruby: `export PATH="/opt/homebrew/opt/ruby/bin:$PATH"`.
