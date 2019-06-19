require 'RSpec'
require './lib/command/home.rb'
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/command/*.rb"].each {|file| require file }