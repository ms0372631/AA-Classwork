#phase I

def first_anagram?(str_1, str_2) #O(n)
  anagram_1 = str_1.split("").permutation.map(&:join)
                   #O(n) +  O(n!) + O(n) + O(n)
  anagram_1.include?(str_2)  #O(n)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

#phase II

def second_anagram?(str_1, str_2)
  temp = str_2.split("") 
  str_1.each_char.with_index  do |char, i| #O(n) **
    temp_idx = temp.find_index(char) #O(n*log(n)) ** (need to check this!)
    return false if temp_idx.nil?
    temp.slice!(temp_idx)           #O(n)
  end   
  temp.join("") == ""
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true


def third_anagram?(str_1, str_2)
  str_1.split("").sort == str_2.split("").sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true


def fourth_anagram?(str_1, str_2)
  hash = Hash.new(0)

  str_1.each_char { |char| hash[char] += 1 }
  str_2.each_char { |char| hash[char] -= 1 }

  hash.all? { |k,v| v == 0 }
end