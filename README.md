# Perry & Gambill LLC — Website

The company website, built with [Jekyll](https://jekyllrb.com/), which GitHub Pages builds automatically on every push to `main`. There's no build step to run before deploying.

## Structure

```
_config.yml              Site settings (title, default email, plugins)
_layouts/default.html    Page shell: head, header, footer
_layouts/app.html        Template for every app's Support & Privacy page
_includes/               Shared pieces (head, header, footer, app icon)
_apps/                   One Markdown file per app  ->  /apps/<file-name>/
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
   The file name becomes the URL: `/apps/my-app/`.
2. Fill in the front matter at the top: `name`, `tagline`, `privacy_effective_date`, and optionally `order`, `app_store_url`, `platforms`, `support_email` and `terms_url`.
   `terms_url` sets the app's Terms of Service link; leave it blank to use Apple's standard EULA (`app_terms_url` in `_config.yml`).
   `order` sets the app's position on `/apps/` (lower numbers first; apps without one follow alphabetically).
3. Replace the privacy policy text below the front matter. It's plain Markdown; each `## Heading` is added to the page's table of contents automatically.
4. Commit and push. The app appears on `/apps/` and is linked from the home page.

Use the page URL for both the **Support URL** and the **Privacy Policy URL** in App Store Connect. To point straight at each section, use `/apps/my-app/#support` and `/apps/my-app/#privacy`.

### App icons

Save a square PNG (1024×1024 recommended) to `assets/img/apps/`, then set the app's `icon` field:

```yaml
icon: /assets/img/apps/my-app.png
```

Until an icon is set, the page shows a placeholder tile with the app's first letter.

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

Old Google Sites links keep working after the switch: `/home` redirects to the home page, and `/home/chronopop` redirects to `/apps/chronopop/`.
