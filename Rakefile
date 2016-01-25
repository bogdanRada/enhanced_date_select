# encoding: utf-8
require File.expand_path('../lib/version', __FILE__)
require 'rubygems'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'appraisal'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'
Coveralls::RakeTask.new

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = ['--backtrace '] if ENV['DEBUG']
end

desc 'Default: run the unit tests.'
task default: [:all]

desc 'Test the plugin under all supported Rails versions.'
task :all do
  if ENV['TRAVIS']
    exec('bundle exec appraisal install && bundle exec rake appraisal spec && bundle exec rake coveralls:push')
  else
    exec('bundle exec appraisal install && bundle exec rake appraisal spec')
  end
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "enhanced_date_select #{EnhancedDateSelect.gem_version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
