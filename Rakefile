require 'bundler'
require 'rdoc/task'
require 'rake/testtask'

Bundler::GemHelper.install_tasks

task :default => :test

RDoc::Task.new do | rd |
  rd.rdoc_dir = "rdoc"
  rd.rdoc_files.include("lib/**/*.rb")
end

Rake::TestTask.new do  |t|
  t.ruby_opts = [ '-rminitest/autorun', '-rminitest/pride', '-rpry', '-rmocha/setup' ]
  t.test_files = FileList['test/**/*test*.rb']
  t.verbose = true
end
