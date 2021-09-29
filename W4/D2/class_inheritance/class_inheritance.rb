class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee

    attr_reader :salary
    attr_accessor :subemployees

    def initialize(name, title, salary, boss = nil)
        super
        @subemployees = []
    end

    def bonus(multiplier)
        sum_sub_salaries * multiplier
    end

    def sum_sub_salaries
        sum = 0
        self.subemployees.each do |sub|
            if sub.is_a?(Manager)
                sum += sub.salary + sub.sum_sub_salaries
            else
                sum += sub.salary
            end
        end
        sum
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
ned.subemployees << darren
darren.subemployees << shawna
darren.subemployees << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000

