require 'rack/unreloader'
Unreloader = Rack::Unreloader.new { Greeter }
require 'roda'
Unreloader.require './backend.rb'
run Unreloader
