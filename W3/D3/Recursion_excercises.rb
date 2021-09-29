
require "byebug"


def range(start_num, end_num)
  #base case 
  #debugger
  last_num = end_num - 1
  return [start_num] if last_num == start_num
  return [] if last_num < start_num
  #arr = []

  [start_num] + range(start_num + 1, last_num) + [last_num]


end

#p range(1, 4) # [1 , 2, 3, 4]

#[1, 2, 3] 

#[1, ]

#def exp(b_num, n_num)
#  return 1 if n_num == 0 # base case
#  
#  b_num * exp(b_num, n_num - 1)
#
#end
#
## recursion 1
## exp(b, 0) = 1
## exp(b, n) = b * exp(b, n - 1)
#
#p exp(2, 4)

def exp(b_num, n_num)
  return 1 if n_num == 0 # base case
  return b_num if n_num == 1

  if n_num.even?
    exp(b_num, n_num / 2) ** 2
  else
    b_num * (exp(b_num, (n_num - 1)/2)**2)
  end
end

#p exp(2, 5)

def deep_dup(arr)   
    collect = Array.new(arr.length)
    return arr if !arr.is_a?(Array)
    arr.each_with_index do |a, i|
        if a.is_a?(Integer)
            collect[i] = a
        else
            collect[i] = deep_dup(a)
        end
    end
    collect
end

# nums = [1, [2], [3, [4]]]
# 
# 
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# p deep_dup(robot_parts)
# p deep_dup(nums)

def fib(n)
  return [] if n == 0
  return [0]if n == 1
  return [0, 1] if n == 2
  
  fib(n-1) << (fib(n - 1)[-2] + fib(n-1)[-1])

end
#3
#[0, 1, 1, 2, 3, 5, 8]
#p fib(0)

def bsearch(array, target)
  return nil if !array.include?(target)
  left = 0
  right = array.length - 1
  mid = (left + right) / 2
  if target == array[mid]
    return mid
  elsif target < array[mid]
    bsearch(array[left...mid], target)
  else
    bsearch(array[mid + 1..right], target) + mid + 1
  end
end


# mid = array[array.length/2]
# left = array[(array.length/2)-1]
# right = array[(array.length/2)+1]

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  return [array[0]] if array.length == 1
  mid = (0 + array.length - 1) / 2 
  merge(merge_sort(array[0..mid]), merge_sort(array[mid + 1..-1]))
end


def merge(arr1, arr2)
  # if arr2[0] < arr1[0], then we unshift arr2[0] on arr1
  # if arr2[0] > arr1[0], then we compare arr2[0] with arr1[1]
  # then if its smaller, put it inbetween use array.insert
  #return arr2 if arr1.empty?
  #return arr1 if arr2.empty?
  #smallest = arr1[0].shift if arr1[0] <= arr2[0]
  #smallest = arr2[0].shift if arr1[0] >= arr2[0]
  res = []
  i = 0
  j = 0

  while i < arr1.length && j < arr2.length
    if arr1[i] < arr2[j]
      res << arr1[i]
      i += 1
    else
      res << arr2[j]
      j += 1
    end
  end

  res

end
smallest = [3]
arr1 = [3, 8, 10, 27]  
arr2 =[8 ,43, 82]
# p merge(arr1, arr2)


p merge_sort([38, 27, 43, 3, 9, 82, 10]) # [3, 9, 10, 27, 38, 43, 82]
p merge_sort([33, 7, 4, 1, 7, 99, 11])