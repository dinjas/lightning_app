# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'capybara/rspec'
require 'rake'

# Prevent database truncation if the environment is production
if Rails.env.production?
  abort('The Rails enviroinment is running in production mode!')
end

require 'rspec/rails'
require 'devise'

# Add additional requires below this line. Rails is not loaded until this point!

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :request
end

def klass_name
  described_class.name.underscore
end

def subject_class
  klass_name.to_sym
end

def subject_class_factory
  klass_name.split('/').last.to_sym
end

def factory
  build(subject_class_factory)
end

def factory_stubbed
  build_stubbed(subject_class_factory)
end

def factory_create
  create(subject_class_factory)
end
