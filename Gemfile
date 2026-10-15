source "https://rubygems.org"

# Mirrors the GitHub Pages build environment (Jekyll, plugins, remote_theme).
gem "github-pages", group: :jekyll_plugins

# Needed on Ruby 3+ for `jekyll serve`.
gem "webrick"

# Windows and JRuby do not include zoneinfo files.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end
