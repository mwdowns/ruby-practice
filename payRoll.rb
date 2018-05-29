class Employee
    attr_reader :name, :balance

    def initialize(name, balance)
        @name = name
        @balance = balance
    end

    def who
        return name
    end

    def balance_amount
        return balance
    end

    def self.balance=(val)
         @balance = val
    end

    def pay (salary)
        puts "Paying #{name} #{salary} for this month"
        self.class.balance = self.balance + salary
    end
end

class Doctor < Employee

    def self.salary
        100_000
    end

    def my_salary
        return self.class.salary
    end

    def pay
        super(self.class.salary)
    end

end

class Programmer < Employee

    def self.salary
        60_000
    end

    def my_salary
        return self.class.salary
    end

    def pay
        super(self.class.salary)
    end

end

matt = Programmer.new("Matt", 100)
jeri = Doctor.new("Jeri", 100)
employees = [matt, jeri]

employees.each do |employee|
    puts employee.name
    puts employee.my_salary
    puts employee.balance_amount
    puts employee.pay
    puts "was I paid?"
    puts employee.balance_amount
end