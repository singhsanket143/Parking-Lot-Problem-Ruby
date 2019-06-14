require './lib/commands/home'
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/command/*.rb"].each {|file| require file }