require File.expand_path("../version", __FILE__)

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
  
   s.add_development_dependency 'rspec-rails', '~> 2.0', '>= 2.0'
  s.add_development_dependency 'guard', '~> 2.6', '>= 2.6.1'
  s.add_development_dependency 'guard-rspec', '~> 4.2', '>= 4.2.9'
  s.add_development_dependency 'appraisal', '~> 1.0', '>= 1.0.0'
  s.add_development_dependency 'simplecov', '~> 0.8', '>= 0.8.2'
  s.add_development_dependency 'simplecov-summary', '~> 0.0', '>= 0.0.4'
  s.add_development_dependency 'mocha','~> 1.1', '>= 1.1.0'
  s.add_development_dependency 'coveralls','~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'shoulda', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'rake',  '~> 10.3', '>= 10.3.0'
  s.add_development_dependency 'rspec-mocks',  '~> 2.14', '>= 2.14.0'

end
