begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'
require 'spree/testing_support/extension_rake'
# How do I load rake tasks from gems again?
task :teaspoon => :environment do |t, args|
  require "teaspoon/console"
  files = ENV['files'].nil? ? [] : ENV['files'].split(',')
  fail if Teaspoon::Console.new({suite: ENV["suite"], driver_cli_options: ENV["driver_cli_options"]}, files ).execute
end

task :environment do
  # dummy task for teaspoon
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_ember_frontend'
  Rake::Task['extension:test_app'].invoke
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SpreeFrontend'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end




Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task default: :test
