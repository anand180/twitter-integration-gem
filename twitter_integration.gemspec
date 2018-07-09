
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_integration/version'

Gem::Specification.new do |spec|
  spec.name          = 'twitter_integration'
  spec.version       = TwitterIntegration::VERSION
  spec.authors       = ['Josiah Sleppy']
  spec.email         = ['josiah@joinroot.com']

  spec.summary       = 'A barebones gem for Twitter integration.'
  spec.description   = 'A barebones gem for application-only Twitter integration.'
  spec.homepage      = 'https://github.com/josiahsleppy/twitter-integration-gem'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'dotenv', '~> 2.5'
  spec.add_dependency 'httparty', '~> 0.16'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
