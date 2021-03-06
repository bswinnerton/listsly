source 'https://rubygems.org'

gem 'dotenv-rails', groups: [:development, :test]

gem 'rails', '4.1.1'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass', '~> 3.1.1'
gem 'devise'
gem 'paper_trail', '~> 3.0.3'

gem 'pry-rails'
gem 'awesome_print'
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', require: false

group :production, :staging do
  gem 'raygun4ruby'
  gem 'newrelic_rpm'
end

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry-remote'
  gem 'better_errors'
  gem 'binding_of_caller'

  # Required here for rails generators
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development do
  gem 'spring'
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'simplecov', require: false
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end
