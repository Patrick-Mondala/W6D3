require "byebug"
class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        boss.add_sub(self) unless boss.nil?
    end

    def bonus(multiplier)
        salary * multiplier
    end

end

class Manager < Employee
    attr_reader :boss
    attr_accessor :subordinates
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        self.subordinates = []
    end

    def add_sub(subordinate)
        subordinates << subordinate
    end

    def sub_dfs(manager, exclude = true)   
        return manager.salary if manager.class == Employee
        sub_salaries = exclude ? 0 : manager.salary 

        manager.subordinates.each do |sub|
            if sub.is_a?(Manager)
                sub_salaries += sub_dfs(sub, false)
            else
                sub_salaries += sub.salary
            end 
        end
        sub_salaries
    end

    def bonus(multiplier)
        sub_dfs(self) * multiplier
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)