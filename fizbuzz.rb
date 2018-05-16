def doFizzBuzz(num)
    if checkFizzBuzz(num)
        puts "fizbuzz"
    elsif checkBuzz(num)
        puts "buzz"
    elsif checkFiz(num)
        puts "fiz"
    else
        puts num
    end
end

def checkFizzBuzz(num)
    if num % 3 == 0 && num % 5 == 0
        return true
    else
        return false
    end
end

def checkBuzz(num)
    if num % 5 == 0
        return true
    else
        return false
    end
end

def checkFiz(num)
    if num % 3 == 0
        return true
    else
        return false
    end
end

(1...50).to_a.map{|num| doFizzBuzz(num)}