require 'roda'
# Class Roda app
class Greeter < Roda
  puts 'hey'
  plugin :multi_route
  Dir['./routes/*.rb'].each { |f| require f }

  route do |r|
    r.multi_route

    r.root do
      r.redirect '/hello'
    end
  end
end

# require './routes/index.rb'
# require './routes/hello.rb'
# require './routes/yo.rb'
