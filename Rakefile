require 'rubygems'
require 'bundler'

$:.push File.expand_path("../lib", __FILE__)
require "gdocs/version"

Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = Gdocs::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gdocs #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
