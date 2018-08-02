Greeter.route('hello') do |r|
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
end