# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'appraisal'
require 'rspec/core/rake_task'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'



RSpec::Core::RakeTask.new(:spec)

desc "Default: run the unit tests."
task :default => [:all]

desc 'Test the plugin under all supported Rails versions.'
task :all => ["appraisal:install"] do |t|
  exec('rake appraisal spec')
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "enhanced_date_select #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
