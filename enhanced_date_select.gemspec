
Gem::Specification.new do |s|
  s.name = "enhanced_date_select"
  s.version     = File.exist?('VERSION') ? File.read('VERSION') : ""
  s.platform    = Gem::Platform::RUBY
  s.summary = "\"enhanced date select\""
  s.email       = "raoul_ice@yahoo.com"
  s.homepage = "http://github.com/bogdanRada/enhanced_date_select"
  s.description = "\"Enhances ActionView with a customizable date select form helper where any valid HTML attribute can be applied.\""
  s.authors     = ["bogdanRada"]
  
  s.date = "2013-12-05"
  
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.licenses = ["MIT"]
  s.files = `git ls-files`.split("\n")
  s.test_files = s.files.grep(/^(spec)/)
  s.require_paths = ["lib"]
  s.add_development_dependency(%q<rspec-rails>, [">= 0"])
  s.add_development_dependency(%q<guard>, [">= 0"])
  s.add_development_dependency(%q<guard-rspec>, [">= 0"])
  s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
  s.add_development_dependency(%q<appraisal>, [">= 0"])
  s.add_development_dependency(%q<shoulda>, [">= 0"])
  s.add_development_dependency(%q<rdoc>, [">= 0"])
  s.add_development_dependency(%q<rspec>, [">= 0"])
  s.add_development_dependency(%q<rake>, [">= 0"])
  s.add_development_dependency(%q<rspec-mocks>, [">= 0"])
  s.add_development_dependency(%q<bundler>, [">= 0"])
  s.add_development_dependency(%q<simplecov>, [">= 0"])
  s.add_development_dependency(%q<simplecov>, [">= 0"])
  s.add_development_dependency(%q<simplecov-rcov>, [">= 0"])
  s.add_development_dependency(%q<simplecov-summary>, [">= 0"])
  s.add_development_dependency(%q<mocha>, [">= 0"])
end
