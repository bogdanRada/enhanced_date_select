require 'date'
require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name = "enhanced_date_select"
  s.version     = EnhancedDateSelect.gem_version
  s.platform    = Gem::Platform::RUBY
  s.summary = "\"enhanced date select\""
  s.email       = "raoul_ice@yahoo.com"
  s.homepage = "http://github.com/bogdanRada/enhanced_date_select"
  s.description = "\"Enhances ActionView with a customizable date select form helper where any valid HTML attribute can be applied.\""
  s.authors     = ["bogdanRada"]

  s.date = Date.today

  s.licenses = ["MIT"]
  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(/^(spec)/)
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency 'appraisal', '~> 2.1', '>= 2.1'
  s.add_development_dependency 'coveralls','~> 0.8', '>= 0.8'
  s.add_development_dependency 'lorax', '~> 0', '>= 0.2'
  s.add_development_dependency 'mocha','~> 1.2', '>= 1.2.0'
  s.add_development_dependency 'nokogiri', '~> 1.7', '>= 1.7'
  s.add_development_dependency 'rake',  '~> 12.0', '>= 12.0'
  s.add_development_dependency 'rspec-mocks',  '~>3.5', '>= 3.5'
  s.add_development_dependency 'rspec-rails', '~> 3.5', '>= 3.5'

  s.add_development_dependency 'shoulda', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'simplecov', '~> 0.12', '>= 0.12'
  s.add_development_dependency 'simplecov-summary', '~> 0.0', '>= 0.0.5'

end
