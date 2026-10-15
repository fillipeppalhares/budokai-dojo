# Budokai Dojo Website

Public information site for an Aikido dojo, built and maintained by a student of the dojo (not the sensei). It presents:

- **The dojo**: who we are, style/lineage, instructor(s), location and contact.
- **Classes**: schedule, audiences (kids, adults, beginners), what to bring, etiquette.
- **Gradings**: for each graduation exam (kyu/dan), the techniques required.

The site is static, content-first and mobile-first (most visitors are students on phones). No backend, no database, no user accounts.

## Stack

- **Jekyll** with the [Jekyll Doc Theme](http://jekyllthemes.org/themes/doc-theme/) (`aksakalli/jekyll-doc-theme`, Bootstrap 3 based, includes sidebar navigation and search).
- **Hosting**: GitHub Pages (free). The theme is loaded with `remote_theme: aksakalli/jekyll-doc-theme@gh-pages`, and the Gemfile uses the `github-pages` gem (not plain `jekyll`) so local builds match production.
- Theme colours come from a Bootswatch name in `_config.yml` (`bootwatch:`). Override theme files by creating a file with the same path in this repo (e.g. `assets/css/main.scss`), never by editing the theme.

## Commands

```bash
bundle install           # first time only (installs into vendor/bundle)
./bin/jekyll serve       # preview at http://localhost:4000
./bin/jekyll build       # build to _site/ (gitignored)
```

Use `./bin/jekyll`, not `bundle exec jekyll`: it preloads `bin/ruby_compat.rb`, a local-only shim for `String#tainted?`, which the Liquid version pinned by `github-pages` needs but Ruby 3.2+ removed. GitHub's own build is unaffected.

Deploys happen automatically when pushing to the branch GitHub Pages is configured to serve.

## Content model

- Prose pages (dojo, classes, contact) are Markdown files with front matter.
- **Gradings are a Jekyll collection** (`_graduacoes/`), one Markdown file per exam, rendered by `_layouts/graduacao.html` at `/graduacoes/<name>/`. This needs no plugin, so it works on GitHub Pages. `graduacoes.md` is the index and lists the collection sorted by `order`; previous/next links on each page use the same order. To add an exam, create a new file (e.g. `_graduacoes/2-kyu.md`) with the next `order`. Fixing a technique means editing that file's front matter, not HTML. The Markdown body holds free-text requirements (minimum practice time etc.).

  ```yaml
  ---
  title: 5º Kyu
  belt: Branca
  order: 1                # position in the index and prev/next
  techniques:
    - name: Shihonage
      japanese: 四方投げ    # optional
      meaning: ""          # optional translation or short description
      attack: Katate-dori  # optional
      variants: [omote, ura]
      video: ""            # optional YouTube URL
  ---
  ```

- Technique names: keep the Japanese romanization as the canonical name, and add a translation or short description where it helps beginners.
- Videos are embedded from YouTube. Do not commit video files to the repo.

## Conventions

- Language: Portuguese (pt-BR) with romanized Japanese terms. Keep romanization spelling consistent across all pages.
- Never invent syllabus content. Exam requirements, schedules, prices and instructor details must come from the owner or the dojo. Use clearly marked `TODO` placeholders when information is missing.
- Keep the site simple: no JavaScript beyond what the theme ships, no extra plugins unless they are on the GitHub Pages allowlist.
- Images should be compressed before committing (web-sized, not camera originals).
- Use relative links via `{{ site.baseurl }}` / `relative_url` so the site works under a GitHub Pages subpath.

## Decisions and open questions

- Sensei approved publishing the exam syllabus and the dojo's name/logo.
- Site language: Portuguese (pt-BR). Keep Japanese terms in romanized form.
- No custom domain for now; the site is served from the `github.io` URL, so `baseurl`/`url` in `_config.yml` must be set once the repo exists.
- Still open: the dojo's organization/federation and the official syllabus (owner will provide).
