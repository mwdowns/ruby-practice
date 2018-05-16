# recursive but gonna fail on bigger numbers
# def fib(n)
#     if (n === 2 || n === 1)
#         return 1
#     end
#     puts "n is #{n}"
#     return fib(n - 1) + fib(n - 2)
# end

# non-recursive
def fib(n)
    values = [1, 1]
    if n == 1 || n == 2
        return 1
    else 
        3.upto(n) do |num|
            sum = values[0] + values[1]
            values[0] = values[1]
            values[1] = sum
        end
        return values[1]
    end
end

puts fib(20)