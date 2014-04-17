source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

# Use Modernizr for better browser compability
gem 'modernizr-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', group: :development


# Communication with other parts
gem 'kalibro_gatekeeper_client', '~> 0.0.1'

group :test do
  # Easier test writing
  gem "shoulda-matchers", require: false # not requiring is necessary to avoid warnings from minitest 5, with version 2.6 this might get fixed

  # Test coverage
  gem 'simplecov', require: false

  # Simple Mocks
  gem 'mocha', :require => 'mocha/api'
end

group :development, :test do
  # Test framework
  gem 'rspec-rails', '~> 2.14.0'

  # Fixtures made easy
  gem 'factory_girl_rails', '~> 4.4.1'

  # JavaScript unit tests
  gem "konacha", "~> 3.2.0"
end

# Acceptance tests
group :cucumber do
  gem 'cucumber', '~> 1.3.10'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'poltergeist', '~> 1.5.0'
end

# Some statistics
gem 'descriptive-statistics', '~> 2.1.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
