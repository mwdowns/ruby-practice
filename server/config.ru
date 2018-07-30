require 'rack/unreloader'
Unreloader = Rack::Unreloader.new{App}
require 'roda'
Unreloader.require './backend.rb'
run Unreloader
