# frozen_string_literal: true

require 'simplecov'

require 'simplecov-lcov'
require 'coveralls'

SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::LcovFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  minimum_coverage(78.48)
end

require 'rspec'
require 'omniauth/osm_oauth2'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
