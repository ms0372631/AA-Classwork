require 'byebug'

#phase I1

def  largest_contiguous_subsum(list)
    subarrays = []
    (0...list.length).each do |idx1|
        (idx1...list.length).each do |idx2|
            subarrays << list[idx1..idx2]
        end
    end

    subarrays.map(&:sum).max
end


# def largest_contiguous_subsum(list, current_sum = -9999999, largest_sum = -9999999 )
#   # debugger
#   return list.first if list.length == 1

#   current_sum = list.last
#   left_sum = largest_contiguous_subsum(list[0...-1], current_sum, largest_sum)

#   current_sum = list.first
#   right_sum = largest_contiguous_subsum(list[1..-1], current_sum, largest_sum)

#   if left_sum + current_sum > left_sum
#     current_sum = left_sum + current_sum 
#   else
#     current_sum = right_sum + current_sum
#   end

#   largest_sum > current_sum ? largest_sum : current_sum

# end

# def largest_contiguous_subsum(list)
#     # debugger
#     largest_sum = -99
#     cur_sum = list.shift
#     sub_arr = [cur_sum]
#     list.each do |a|
#         cur_sum += a
#         sub_arr << a
#         if sub_arr.length >= 1 && cur_sum - sub_arr.first > cur_sum
#           cur_sum = cur_sum - sub_arr.first
#           sub_arr.unshift(a)
#         end
#         largest_sum = cur_sum if cur_sum > largest_sum
#     end
#     largest_sum
# end

# def largest_contiguous_subsum(list)
#   # debugger
#   largest_sum = list.sum
#   current_sum = largest_sum # sum of [2, 3, -6, 7, -6, 7, 1]

#   i = 0
#   until i == list.length   # sum of [2, 3, -6, 7, -6, 7, 1]
#     current_sum -= list[i]

#     break if i == list.length - 2

#     if current_sum > largest_sum #&& i != list.length - 2
#       largest_sum = current_sum 
#       start_idx = i
#     end

#     i += 1
#   end

#   start_idx = 0 if start_idx.nil?
#   current_sum = largest_sum #if largest_sum > current_sum

#   j = list.length - 1
#   until j == start_idx + 1
#     current_sum -= list[j]
#     j -= 1

#     largest_sum = current_sum if current_sum > largest_sum
#   end

#   largest_sum
# end

def largest_contiguous_subsum(list)
  largest_sum = list.first
  current_sum = list.first

  (1...list.length).each do |idx|
    current_sum = 0 if current_sum < 0

    current_sum += list[idx]

    largest_sum = current_sum if current_sum > largest_sum
  end

  largest_sum
end


list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7, 1]
p largest_contiguous_subsum(list) # => 9 (from [7, -6, 7, 1])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])