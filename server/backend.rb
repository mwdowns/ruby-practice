# cat config.ru
require 'roda'
# Class Roda app
class App < Roda
  route do |r|
    # GET / request
    r.root do
      r.redirect '/hello'
    end

    # /hello branch
    r.on 'hello' do
      @greeting = 'hello'

      r.get 'world' do
        @greeting = 'hola'
        "#{@greeting} world!"
      end

      r.is do
        r.get do
          "#{@greeting}!"
        end

        r.post do
          puts "Someone said #{@greeting}!"
          r.redirect
        end
      end
    end

    r.on 'yo' do
      @greeting = 'yo'

      r.get :name do |name|
        @name = name
        "#{@greeting} #{@name}!"
      end

      r.is do
        r.get do
          "#{@greeting}, my man!"
        end
      end
    end
  end
end
