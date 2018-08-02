Greeter.route('yo') do |r|
  r.on 'yo' do
    @greeting = 'yo'

    r.get :name do |name|
      @name = name
      "#{@greeting} #{@name}!"
    end

    r.is do
      r.get do
        "#{@greeting}, my man! You're #{@name}, right?"
      end
    end
  end
end