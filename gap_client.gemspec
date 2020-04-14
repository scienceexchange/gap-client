lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gap_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'gap_client'
  spec.version       = GapClient::VERSION
  spec.authors       = ['Science Exchange']
  spec.email         = ['devs@scienceexchange.com']

  spec.summary       = 'A Ruby wrapper for the Gmail Attachment Processor API.'
  spec.description   = "A Ruby wrapper for the Gmail Attachment Processor API.
                        Please see https://gap.scienceexchange.com/api-docs/v1#/ for documentation."
  spec.homepage      = 'https://gap.scienceexchange.com'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday'
  spec.add_dependency 'jsonapi', '~> 0.1.1.beta6'
end
