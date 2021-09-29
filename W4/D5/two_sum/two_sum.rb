#BRUTE FORCE

#time complexity = O(n^2)
def two_sum?(arr, target_sum)
  pairs = []
  arr.each_index do |idx_1|
    (idx_1 + 1...arr.length).each do |idx_2|
      pairs << [arr[idx_1], arr[idx_2]]
    end
  end

  pairs.any? { |pair| pair.sum == target_sum }
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false


#Time complexity: O(n*log(n))
def okay_two_sum?(arr, target_sum) 
  arr.sort!

  idx_start = 0
  idx_end = arr.length - 1

  until idx_start == idx_end
    current_sum = arr[idx_start] + arr[idx_end]

    return true if current_sum == target_sum

    if current_sum < target_sum 
      idx_start +=1 
    else
      idx_end -= 1
    end
  end

  false

end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false



def hash_two_sum?(arr, target_sum)
  complement_hash = Hash.new

  arr.each do |ele|
    complement_hash[ele] = target_sum - ele
  end

  complement_hash.each_value do |value|
    return true if complement_hash.has_key?(value)
  end

  false 
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 6) # => should be true
p hash_two_sum?(arr, 10) # => should be false


