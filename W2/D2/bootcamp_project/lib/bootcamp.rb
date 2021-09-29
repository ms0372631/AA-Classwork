class Bootcamp

    attr_reader :name, :slogan, :teachers, :students

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new {|h, k| h[k] = []}
    end

    def hire(name)
        @teachers << name
    end

    def enroll(name)
        if @students.length < @student_capacity
            @students << name
            return true
        else
            return false
        end
    end

    def enrolled?(name)
        @students.include?(name)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(name, grade)
        if self.enrolled?(name)
            @grades[name] << grade
            return true
        else
            return false
        end
    end

    def num_grades(name)
        @grades[name].length
    end

    def average_grade(name)
        if self.enrolled?(name) && self.num_grades(name) != 0
            sum = 0
            @grades[name].each do |a|
                sum += a
            end
            return sum / self.num_grades(name)
        end
        nil
    end







end
