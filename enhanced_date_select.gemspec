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

  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.licenses = ["MIT"]
  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(/^(spec)/)
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency 'appraisal', '~> 2.0', '>= 2.0'
  s.add_development_dependency 'coveralls','~> 0.8', '>= 0.8'
  s.add_development_dependency 'guard', '~> 2.13', '>= 2.13'
  s.add_development_dependency 'guard-rspec', '~> 4.6', '>= 4.6'
  s.add_development_dependency 'lorax', '~> 0', '>= 0.2'
  s.add_development_dependency 'mocha','~> 1.1', '>= 1.1.0'
  s.add_development_dependency 'nokogiri', '~> 1.6', '>= 1.6'
  s.add_development_dependency 'phare', '~> 0.7', '>= 0.7'
  s.add_development_dependency 'rake',  '~> 10.4', '>= 10.4'
  s.add_development_dependency 'rspec-mocks',  '~>3.3', '>= 3.3'
  s.add_development_dependency 'rspec-rails', '~> 3.3', '>= 3.3'
  s.add_development_dependency 'rubocop', '~>0.33' , '>= 0.33'
  s.add_development_dependency 'shoulda', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'simplecov', '~> 0.10', '>= 0.10'
  s.add_development_dependency 'simplecov-summary', '~> 0.0', '>= 0.0.4'

end
