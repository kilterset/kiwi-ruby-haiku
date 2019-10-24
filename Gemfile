# frozen_string_literal: true

source 'https://rubygems.org'

ruby Pathname('.ruby-version').read

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.11'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # Testing framework
  gem 'rspec-rails'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Audit gem dependencies
  gem 'bundler-audit'

  # Quality checks for git hooks
  gem 'overcommit'

  # Linting
  gem 'rubocop'

  # Browser simulation
  gem 'capybara'
  gem 'selenium-webdriver'

  # Debugging
  gem 'pry-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
