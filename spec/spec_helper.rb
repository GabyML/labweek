# Generated by rspec-sinatra. (2015-08-24 10:45:55 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/que_onda.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'factory_girl'
require 'database_cleaner'
require_relative './factories/user'
require_relative './helpers/helpers'
require_relative './models/user_spec'
require_relative './models/email_handler_spec'

Capybara.app = QueOnda

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
