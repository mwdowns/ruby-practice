# cat config.ru
require 'roda'
# Class Roda app
class Greeter < Roda
  puts 'hey'
  plugin :multi_route
  puts 'hey hey'
  # route('/') do |r|
  #   puts 'here'
  #   r.multi_route('index')
  # end

  route('hello') do |r|
    puts 'hey hey hey'
    r.multi_route('hello')
  end

  route('yo') do |r|
    r.multi_route('yo')
  end
  # route do |r|
  #   # GET / request
  #   r.root do
  #     r.redirect '/hello'
  #   end

  #   # /hello branch
  #   r.on 'hello' do
  #     @greeting = 'hello'

  #     r.get 'world' do
  #       @greeting = 'hola'
  #       "#{@greeting} world!"
  #     end

  #     r.is do
  #       r.get do
  #         "#{@greeting}!"
  #       end

  #       r.post do
  #         puts "Someone said #{@greeting}!"
  #         r.redirect
  #       end
  #     end
  #   end

  #   r.on 'yo' do
  #     @greeting = 'yo'

  #     r.get :name do |name|
  #       @name = name
  #       "#{@greeting} #{@name}!"
  #     end

  #     r.is do
  #       r.get do
  #         "#{@greeting}, my man! You're #{@name}, right?"
  #       end
  #     end
  #   end
  # end
end
