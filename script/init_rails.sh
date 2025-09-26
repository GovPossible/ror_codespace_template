#!/usr/bin/env bash
set -euo pipefail

# Ensure bundler and rails
gem install bundler -N || true
if ! command -v rails >/dev/null 2>&1; then
  gem install rails -N
fi

# If there is no Rails app yet, create one in-place
if [ ! -f "bin/rails" ] || [ ! -f "config/application.rb" ]; then
  echo "➡️  No Rails app detected. Generating a new Rails app..."
  rm -f .ruby-version # let devcontainer image choose ruby
  rails new . --force --skip-jbuilder --css tailwind --database=postgresql
fi

# Ensure required gems exist (idempotent)
bundle add tailwindcss-rails jsbundling-rails --skip-install || true

bundle install

# Create DB if not present
export DATABASE_URL=${DATABASE_URL:-postgres://postgres:postgres@localhost:5432/app_development}
bin/rails db:prepare

# Make sure Tailwind build dir exists
mkdir -p app/assets/builds

# Copy our overlay UI files (idempotent overwrites ok)
cp -f app/assets/stylesheets/application.tailwind.css app/assets/stylesheets/application.tailwind.css 2>/dev/null || true

# Ensure root route exists
if ! grep -q "root " config/routes.rb ; then
  echo "root 'rails/info#index'" >> config/routes.rb
fi

echo "✅ Rails app ready."
echo "Next: Run → 'Rails server' (port 3000)."
