require 'bundler'
require "rake/rdoctask" 

Bundler::GemHelper.install_tasks

task :default => :test

# Generate documentation
Rake::RDocTask.new do |rd| 
rd.rdoc_files.include("lib/**/*.rb")
rd.rdoc_dir = "rdoc" 
end   


#Added to get testing working
require 'rake/testtask'
Rake::TestTask.new(:test)
