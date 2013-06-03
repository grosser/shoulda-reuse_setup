require 'appraisal'
require 'bundler/gem_tasks'
require 'bump/tasks'

task :test do
  sh "ruby test/shoulda/reuse_setup_test.rb"
end

task :default do
  sh "rake appraisal:install && rake appraisal test"
end
