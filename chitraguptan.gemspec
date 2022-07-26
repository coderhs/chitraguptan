require_relative "lib/chitraguptan/version"

Gem::Specification.new do |spec|
  spec.name        = "chitraguptan"
  spec.version     = Chitraguptan::VERSION
  spec.authors     = ["Harisankar P S"]
  spec.email       = ["mailme@hsps.in"]
  spec.homepage    = "https://github.com/coderhs/chitraguptan"
  spec.summary     = "A ruby gem/engine to manage variables and feature flags"
  spec.description = "A ruby gem/engine to manage variables and feature flags"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3.1"
  spec.add_dependency "redis", ">= 4"
end
