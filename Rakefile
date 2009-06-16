# -*- ruby -*-

require 'rubygems'
require 'need'
require 'rake/testtask'
need { 'lib/diggr.rb' }

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/test_*.rb']
end

# vim: syntax=Ruby
