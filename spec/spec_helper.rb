require 'rubygems'
require 'bundler'
Bundler.setup

require 'active_record'
require 'squeel'
begin; require 'turn'; rescue LoadError; end

require 'bitmask_attributes'
require 'bitmask_attributes_helpers'

$:.unshift File.expand_path("../../lib", __FILE__)


ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)


# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
