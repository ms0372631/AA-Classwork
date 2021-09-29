require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if @salaries.include?(title)
        false
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "this title is invalid"
        end
    end
    
    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding >= @salaries[employee.title]
            @funding -= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            raise "No enough fund to pay this employee"
        end
    end

    def payday
        @employees.each do |a|
            pay_employee(a)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |a|
            sum += @salaries[a.title]
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k, v|
            @salaries[k] = v if !@salaries.has_key?(k)
        end
        startup.employees.each do |a|
            @employees << a
        end
        startup.close
    end
end
