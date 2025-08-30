require_relative 'lib/pricing/version'

Gem::Specification.new do |spec|
  spec.name        = 'pricing'
  spec.version     = Pricing::VERSION
  spec.authors     = ['guutong']
  spec.email       = ['pornmongkonp@gmail.com']
  spec.homepage    = 'https://example.com'
  spec.summary     = 'Summary of Pricing.'
  spec.description = 'Description of Pricing.'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 8.0.2.1'
end
