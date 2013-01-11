source 'http://rubygems.org'

gem 'rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'paperclip', "~> 2.7.0"
gem 'aws-sdk', "~> 1.3.6"
gem 'ckeditor_rails'
# gem 'bcrypt-ruby'

# HEROKU
group :production do
  gem 'pg'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'guard'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'launchy' 
  gem 'rb-fsevent', require: false
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'cucumber'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
