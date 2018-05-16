def fib(n)
    if (n === 2 || n === 1)
        return 1
    end
    puts "n is #{n}"
    return fib(n - 1) + fib(n - 2)
end

puts fib(6)