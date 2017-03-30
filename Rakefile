require 'bundler/setup'
require 'bundler/gem_tasks'
require 'gemfury/tasks'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.verbose = true
end
task :default => :test

task :cov do
  ENV["COV"] = "1"
  Rake::Task[:test].invoke
end

require 'rdoc/task'
require './lib/business_time/version'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "business_time #{BusinessTime::VERSION}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rake::Task['release'].clear

desc "Tag and release to gemfury under the 'citybase' organization"
task 'release' => 'release:source_control_push' do
  Rake::Task['fury:release'].invoke('business_time.gemspec', 'citybase')
end
