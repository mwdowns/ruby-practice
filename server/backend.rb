require 'roda'
# Class Roda app
class Greeter < Roda
  puts 'hey'
  plugin :multi_route

  puts 'hey hey hey'
  route(&:multi_route)
end

Dir['./routes/*.rb'].each { |f| require f }
