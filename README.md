# Perry & Gambill LLC — Website

Static website for Perry & Gambill LLC, built with plain HTML, CSS, and a small amount of JavaScript. No build step; it deploys directly to GitHub Pages.

## Structure

```
index.html            Home page (hero, focus areas, mission, contact)
legal.html            Terms and Conditions (served at /legal)
home/index.html       Redirects the old Google Sites /home URL to /
404.html              Not-found page (self-contained styles)
assets/css/styles.css All site styles (colors/fonts are variables at the top)
assets/js/main.js     Mobile menu, footer year, scroll fade-in
assets/img/mark.svg   Favicon / logo mark
robots.txt, sitemap.xml, .nojekyll
```

## Preview locally

```sh
python3 -m http.server 8000
# open http://localhost:8000
```

## Deploy to GitHub Pages

1. Push this repository to GitHub.
2. In the repo, go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, branch `main`, folder `/ (root)`, and save.
4. The site will be live at `https://<username>.github.io/<repo>/` within a minute or two.

## Point www.perrygambill.com at GitHub Pages

1. In **Settings → Pages → Custom domain**, enter `www.perrygambill.com` and save (GitHub adds a `CNAME` file to the repo).
2. At your DNS provider (wherever perrygambill.com is registered — likely Google Domains/Squarespace if set up with Google Sites):
   - Remove the existing Google Sites mapping for `www`.
   - Add a `CNAME` record: `www` → `<username>.github.io`
   - For the bare domain (`perrygambill.com`), add `A` records pointing to:
     `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`
3. Once DNS propagates and GitHub verifies the domain, check **Enforce HTTPS**.

## Editing content

- Text lives directly in `index.html` and `legal.html`.
- Brand colors and fonts are defined as CSS variables at the top of `assets/css/styles.css`.
- The contact email appears in both HTML files (search for `support.perrygambill@icloud.com`).
