# frozen_string_literal: true

require_relative 'lib/omniauth/osm_oauth2'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-osm-oauth2'
  spec.version       = OmniAuth::OsmOauth2::VERSION
  spec.authors       = ['KURASAWA Nozomu']
  spec.email         = ['nabetaro@caldron.jp']

  spec.summary       = 'OmniAuth OpenStreetMap strategy via OAuth2.'
  spec.description   = 'OmniAuth OpenStreetMap strategy via OAuth2.'
  spec.homepage      = 'https://github.com/nabetaro/omniauth-osm-oauth2'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/nabetaro/omniauth-osm-oauth2'
  spec.metadata['changelog_uri'] = 'https://github.com/nabetaro/omniauth-osm-oauth2/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'omniauth-oauth2', '~> 1.0'

  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.7'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov'
end
