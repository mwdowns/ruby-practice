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
  end
end

run App.freeze.app
