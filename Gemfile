source "https://rubygems.org"

# Mirrors the GitHub Pages build environment (Jekyll, plugins, remote_theme).
gem "github-pages", group: :jekyll_plugins

# Needed on Ruby 3+ for `jekyll serve`.
gem "webrick"

# Removed from the standard library in recent Rubies, still required by Jekyll 3.9.
gem "csv"
gem "base64"
gem "bigdecimal"
gem "logger"
gem "ostruct"
gem "observer"

# Windows and JRuby do not include zoneinfo files.
install_if -> { RUBY_PLATFORM =~ %r!mingw|mswin|java! } do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end
