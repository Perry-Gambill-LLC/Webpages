# Perry & Gambill LLC — Website

The company website, built with [Jekyll](https://jekyllrb.com/), which GitHub Pages builds automatically on every push to `main`. There's no build step to run before deploying.

## Structure

```
_config.yml              Site settings (title, default email, plugins)
_layouts/default.html    Page shell: head, header, footer
_layouts/app.html        Template for every app's Support & Privacy page
_layouts/terms.html      Template for an app's Terms of Use on one platform
_includes/               Shared pieces (head, header, footer, app icon)
_apps/                   One Markdown file per app (English)  ->  /apps/<file-name>/en-us/
_apps/es-mx/, _apps/pt-br/  Translations of each app page  ->  /apps/<file-name>/es-mx/ etc.
_terms/android/          An app's own Terms of Use on Android, named like its _apps/ file
                           ->  /apps/<file-name>/en-us/terms/android/ (translations in es-mx/, pt-br/)
_data/i18n.yml           Interface text for app pages, header and footer, per language
scripts/translations.rb  Checks that translations are complete and up to date
_templates/app.md        Starter file for a new app (never published)
index.html               Home page
legal.html               Terms and Conditions (served at /legal)
apps/index.html          Apps listing (served at /apps/)
404.html                 Not-found page
assets/css/styles.css    All styles (colors/fonts are variables at the top)
assets/js/main.js        Mobile menu, footer year, scroll fade-in
assets/img/apps/         App icons
```

## Adding a new app

1. Copy `_templates/app.md` to `_apps/<app-name>.md`, e.g. `_apps/my-app.md`.
   The file name becomes the URL: `/apps/my-app/en-us/`. Set `redirect_from` to `/apps/my-app/` (as in the template) so the short URL `/apps/my-app/` redirects there.
2. Fill in the front matter at the top: `name`, `tagline`, `privacy_effective_date`, and optionally `order`, `app_store_url`, `platforms`, `support_email` and `terms_url`.
   `terms_url` sets the app's Terms of Service link; leave it blank to use Apple's standard EULA (`app_terms_url` in `_config.yml`).
   Apple's EULA only covers the App Store. If the app is also on Google Play, give it its own terms there (see [Terms of Use for Android](#terms-of-use-for-android)).
   `order` sets the app's position on `/apps/` (lower numbers first; apps without one follow alphabetically).
3. Replace the privacy policy text below the front matter. It's plain Markdown; each `## Heading` is added to the page's table of contents automatically.
4. Add the Mexican Spanish and Brazilian Portuguese translations (see [Translations](#translations)).
5. Commit and push. The app appears on `/apps/` and is linked from the home page.

Use the page URL, e.g. `/apps/my-app/en-us/`, for both the **Support URL** and the **Privacy Policy URL** in App Store Connect. To point straight at each section, add `#support` or `#privacy`. The short URL `/apps/my-app/` also works and keeps the `#support`/`#privacy` part when it redirects, so App Store links set up before the `/en-us/` change still work.

### App icons

Save a square PNG (1024×1024 recommended) to `assets/img/apps/`, then set the app's `icon` field:

```yaml
icon: /assets/img/apps/my-app.png
```

Until an icon is set, the page shows a placeholder tile with the app's first letter.

## Terms of Use for Android

On iPhone, apps use Apple's standard EULA. Google Play has no standard terms, so an app on Android has its own: `_terms/android/<app>.md`, with the same file name as the app's `_apps/` page. Amigology's is `_terms/android/amigology.md`.

- It's published at `/apps/<app>/en-us/terms/android/`, and the short URL `/apps/<app>/terms/android/` (set it under `redirect_from`) redirects there. Translations are at `/apps/<app>/es-mx/terms/android/` and `/apps/<app>/pt-br/terms/android/`.
- Its front matter is `description` and `effective_date`. The page title, heading and icon come from the app and `_data/i18n.yml`.
- Once it exists, the app's page lists it under Helpful links, beside Apple's terms (labelled "for iPhone").
- Link the app's Android build to the page for its language. Translations work as for app pages (below).

Another platform would get its own folder, e.g. `_terms/<platform>/`, plus a `defaults` entry in `_config.yml` and `terms_heading_<platform>` / `terms_link_<platform>` strings in `_data/i18n.yml`.

## Translations

Each app page (and each Terms of Use page, the same way, in `_terms/<platform>/<lang>/`) is published in US English, Mexican Spanish and Brazilian Portuguese, at `/apps/<app>/en-us/`, `/apps/<app>/es-mx/` and `/apps/<app>/pt-br/`. Each page has a language switcher. The languages are listed under `translations` in `_config.yml`.

- A translation lives at `_apps/es-mx/<app>.md` or `_apps/pt-br/<app>.md`, with the same file name as the English page.
- Its front matter holds only the translated `tagline`, `description` and `privacy_effective_date` (for terms: `description` and `effective_date`), plus `source_hash`. Everything else (name, icon, App Store link, support email, terms link) comes from the English page.
- Each heading keeps the English heading's ID, written explicitly: `## Información que recopilamos {#information-we-collect}`.
- Buttons, labels, header and footer text come from `_data/i18n.yml`.

**When you change an English app page, update both translations in the same commit.** To check:

```sh
ruby scripts/translations.rb
```

It lists any translation that's missing or older than its English page, with the `git diff` of the English changes to translate. After updating a translation, mark it as current:

```sh
ruby scripts/translations.rb stamp _apps/es-mx/<app>.md _apps/pt-br/<app>.md
ruby scripts/translations.rb stamp _terms/android/es-mx/<app>.md _terms/android/pt-br/<app>.md
```

The same check runs on GitHub (Actions → Translations) on every push to `main`. A failed check doesn't stop the site from publishing; it just flags that the translations are behind.

In App Store Connect, set each localization's Privacy Policy URL and Support URL to its page: English (U.S.) → `/apps/<app>/en-us/`, Spanish (Mexico) → `/apps/<app>/es-mx/`, Portuguese (Brazil) → `/apps/<app>/pt-br/`.

## Changing the contact email

The site-wide email is `email:` in `_config.yml`. Every page uses it. An app can override it with its own `support_email`.

## Preview locally

Requires Homebrew Ruby (`brew install ruby`). macOS's built-in Ruby is too old.

```sh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
bundle config set --local path vendor/bundle   # first time only
bundle install                                 # first time only
bundle exec jekyll serve --livereload
# open http://localhost:4000
```

## Deploy to GitHub Pages

1. In the repo, go to **Settings → Pages**.
2. Under **Build and deployment**, choose **Deploy from a branch**, branch `main`, folder `/ (root)`, and save.
3. The site will be live at `https://perry-gambill-llc.github.io/Webpages/` within a minute or two.

## Point www.perrygambill.com at GitHub Pages

1. In **Settings → Pages → Custom domain**, enter `www.perrygambill.com` and save (GitHub adds a `CNAME` file to the repo).
2. At your DNS provider:
   - Remove the existing Google Sites mapping for `www`.
   - Add a `CNAME` record: `www` → `perry-gambill-llc.github.io`
   - For the bare domain (`perrygambill.com`), add `A` records pointing to:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
3. Once DNS propagates and GitHub verifies the domain, check **Enforce HTTPS**.

Old Google Sites links keep working after the switch: `/home` redirects to the home page, and `/home/chronopop` redirects to `/apps/amigology/en-us/`. The app was renamed from Chronopop to Amigology, so `/apps/chronopop/` also redirects there.
