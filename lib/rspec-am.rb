require 'rubygems'
require 'rails'
require 'active_record'

%w[belong_to have_many have_one].each do |item|
  require File.join(File.dirname(__FILE__), 'rspec-am', item)
end