require './lib/commands/home'
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/commands/*.rb"].each {|file| require file }