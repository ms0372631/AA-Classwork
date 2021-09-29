require 'byebug'
class Array

    def my_each(&prc)
        i=0
        while ( i< self.length)
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        # arr =[]
        # i=0
        # # while ( i< self.length)
        # #     prc.call(self[i])
        # #     arr << self[i] if prc.call(self[i])
        # #     i+=1
        # # end
        # #if prc.call(self[i])
        # #self.my_each(&prc).each do |ele|
        # arr << ele if prc.call(self.my_each(&prc))

        # arr
        result=[]
        arr= my_each(&prc)
        i=0
        while ( i< arr.length)
            result << arr[i] if prc.call(arr[i])
            i+=1
        end
        result

    end

    def my_reject(&prc)
        result=[]
        arr= my_each(&prc)
        i=0
        while ( i< arr.length)
            result << arr[i] if !prc.call(arr[i])
            i+=1
        end
        result
    end

    def my_any?(&prc)
        i=0
        while ( i< self.length)
            return true if prc.call(self[i])
            i+=1
        end
        false
    end

    def my_all?(&prc)
        i=0
        while ( i< self.length)
            return false if !prc.call(self[i])
            i+=1
        end
        true
    end

    # def my_flatten
    #     if !self[0].kind_of?(Array)
    #         return [self[0]]
    #         # self[0].my_flatten + self[1..-1].my_flatten
    #     else
    #         self[0].my_flatten + self[1..-1]
    #     end
    # end

    def my_flatten
        res = []
        #debugger
        return [self] if !self.kind_of?(Array)
        self.each do |d|
            if d.kind_of?(Array)
                res += d.my_flatten 
            else
                res+=[d]
            end
        end
        res
    end

    def my_zip(*arr)
        array_2d = []
        self.each.with_index do |ele, i|
            row = [self[i]]
            arr.each do |subarr|
                row << subarr[i]
            end
        array_2d << row
        end
        array_2d
    end

    def my_rotate(number=1)
        arr=[]
        self.each.with_index do |ele,i|
            arr<< self[(i+number)%self.length]
        end 
        return arr
    end

    def my_join(str="")
        res = ""
        
        self.each do |char|
            res += char + str
        end
        if str == ""
            return res
        else
            return res[0..-2]
        end
    end

    def my_reverse
        result=[]
        i=0
        while i<self.length
            result<<self[self.length-1-i]
            i+=1
        end
        result
    end

end


# return_value = [1, 2, 3].my_each do |num|
#    puts num
# end
# .my_each do |num|
#   puts num
# end

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p a.my_zip([1,2], [8]) 
# p [1, 2, 3].my_zip(a, b)
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# # p [1, 2, 3,c = [10, 11, 12]
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)  # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]