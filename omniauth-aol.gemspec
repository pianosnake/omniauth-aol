lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-aol/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'faraday',   ['>= 0.8', '< 0.10']
  gem.add_dependency 'multi_json', '~> 1.3'
  gem.add_dependency 'oauth2',     '~> 0.9.3'
  gem.add_dependency 'omniauth',   '~> 1.2'

  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.authors       = ['Florin Alexandrescu']
  gem.email         = ['pianosnake@gmail.com']
  gem.description   = %q{AOL adapter for OmniAuth.}
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/pianosnake/omniauth-aol'
  gem.license       = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-aol'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::OAuth2::VERSION
end
