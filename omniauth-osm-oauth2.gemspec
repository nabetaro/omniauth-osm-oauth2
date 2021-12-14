# frozen_string_literal: true

require_relative "lib/omniauth/osm/oauth2/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-osm-oauth2"
  spec.version       = Omniauth::OsmOauth2::VERSION
  spec.authors       = ["KURASAWA Nozomu"]
  spec.email         = ["nabetaro@caldron.jp"]

  spec.summary       = "OpenStreetMap strategy for OmniAuth via OAuth2."
  spec.description   = "OpenStreetMap strategy for OmniAuth via OAuth2."
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
