source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Backend.
gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'jbuilder', '~> 2.7'

# Se usa para las variantes de imágenes en Active Storage.
gem 'image_processing', '~> 1.2'

# UI.
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'

# Autenticación.
gem 'devise'

# Internacionalización.
gem 'rails-i18n'
gem 'devise-i18n'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'minitest-rails'
  gem 'factory_bot_rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Deploy
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-webpacker-precompile', require: false

  # Analizadores de código.
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  # Limpiar la base de datos entre tests.
  gem 'database_cleaner'

  # Tests de sistema con capybara y selenium.
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'capybara-email'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
