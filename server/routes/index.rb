Greeter.route do |r|
  r.root do
    r.redirect '/hello'
  end
end