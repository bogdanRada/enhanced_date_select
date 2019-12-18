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
  s.author      = 'bogdanRada'
  s.authors     = [s.author]

  s.date = Date.today

  s.licenses = ['MIT']
  s.files = `git ls-files`.split("\n") - `git ls-files -- .github/*`.split("\n")
  s.test_files = s.files.grep(/^(spec|test|features)/)
  s.require_paths = ["lib"]

  s.required_ruby_version = '>= 2.2'
  s.required_rubygems_version = '>= 2.4'

  s.metadata = {
    'source_code' => s.homepage,
    'bug_tracker' => "#{s.homepage}/issues",
    'documentation' => "#{s.homepage}/README.md",
    'github_repo' => "ssh://git@github.com:#{s.author}/#{s.name}"
  }

  s.add_development_dependency 'appraisal', '~> 2.2', '>= 2.2'
  s.add_development_dependency 'coveralls','~> 0.8', '>= 0.8'
  s.add_development_dependency 'lorax', '~> 0', '>= 0.2'
  s.add_development_dependency 'mocha','~> 1.10', '>= 1.10.1'
  s.add_development_dependency 'nokogiri', '>= 1.9'
  s.add_development_dependency 'rake',  '~> 13.0', '>= 13.0.1'
  s.add_development_dependency 'rspec-mocks',  '~>3.9', '>= 3.9.0'
  s.add_development_dependency 'rspec-rails', '~> 3.9', '>= 3.9'

  s.add_development_dependency 'shoulda', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'simplecov', '>= 0.9.1'
  s.add_development_dependency 'simplecov-summary', '>= 0.0.6'
  s.add_development_dependency 'keycutter'

end
