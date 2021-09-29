require 'byebug'

#Time Complexity: #O(n^2)
def windowed_max_range(array, window_size) 
  current_max_range = nil
  
  i = 0
  while i + window_size - 1 < array.length #O(n)
    # debugger
    sub_arr = array[i..i+window_size - 1] #O(n)
    min = sub_arr.min #O(n)
    max = sub_arr.max #O(n)

    if current_max_range.nil? || max - min > current_max_range
      current_max_range = max - min 
    end

    i += 1
  end 

  current_max_range
end


# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

