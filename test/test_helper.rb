ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/mock'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class TestResponse
  attr_reader :body_file
  def initialize(body_file, success = true)
    @body_file = body_file
    @success = success
  end

  def success?
    @success
  end

  def body
    YAML.load(File.read(File.expand_path("./test/response_fixtures/#{self.body_file}.yml", Rails.root))).to_json
  end
end