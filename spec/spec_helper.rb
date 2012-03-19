require 'rubygems'
require 'spork'
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require 'database_cleaner'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
  RSpec.configure do |config|
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"
    # config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.mock_with :rspec
    config.include Factory::Syntax::Methods    
  
    DatabaseCleaner.strategy = :transaction

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end 
  end
end

Spork.each_run do
  FactoryGirl.reload
  Uplate::Application.reload_routes!
  DatabaseCleaner.clean_with(:truncation)
end
