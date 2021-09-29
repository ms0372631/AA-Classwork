def strange_sums(arr)
    cnt = 0
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |j|
            cnt += 1 if arr[i] + arr[j] == 0
        end
    end
    cnt
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

def pair_product(arr, num)
    (0...arr.length).each do |i|
        (i + 1...arr.length).each do |j|
            return true if arr[i] * arr[j] == num
        end
    end
    false
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    res = ""
    str.each_char do |c|
        if hash.key?(c)
            hash[c].times {res << c}  
        else
            res << c
        end
    end
    res
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    return true if num == 1
    (1..num / 2).each do |i|
        return true if i * i == num
    end
    false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

def anti_prime?(num)

    d_num = 0
    (1..num).each do |i|
        d_num += 1 if num % i == 0
    end

    (1..num).each do |a|
        l_num = 0
        (1..num).each do |i|
            l_num += 1 if a % i == 0
        end
        return false if l_num > d_num
    end
    true
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

def matrix_addition(arr1, arr2)
    res = []
    i = 0
    while i < arr1.length
        out = []
        j = 0
        while j < arr1[0].length
            out << arr1[i][j] + arr2[i][j]
            j += 1
        end
        i += 1
        res << out
    end
    res
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors (num, *other_nums)
    res = factors(num)
    other_nums.each do |a|
        arr = res
        res = []
        arr.each do |b|
            res << b if factors(a).include?(b)
        end
    end
    res
end

def factors(num)
    res = []
    (1..num).each do |i|
        res << i if num % i == 0
    end
    res
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    return 1 if num <= 2
    return 2 if num == 3
    res = [1, 1, 2]
    j = 0
    while res.length < num
        sum = 0
        i = j
        while i < res.length
            sum += res[i]
            i += 1
        end
        res << sum
        j += 1
    end
    res[-1]
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

def matrix_addition_reloaded(a, *other_arr)
    i = 0
    while i < a.length
        j = 0
        while j < a[0].length
            other_arr.each do |b|
                return nil if a.length != b.length
                a[i][j] += b[i][j]
            end
            j += 1
        end
        i += 1
    end 
    a
end

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    i = 0
    while i < arr.length
        j = 0
        whole1 = true
        while j < arr[0].length - 1
            whole1 = false if arr[i][j] != arr[i][j + 1]
            j += 1
        end
        return true if whole1
        i += 1
    end
    y = 0
    while y < arr[0].length
        x = 0
        whole2 = true
        while x < arr.length - 1
            whole2 = false if arr[x][y] != arr[x + 1][y]
            x += 1
        end
        return true if whole2
        y += 1
    end
    false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

def squaragonal?(arr)
    i = 0
    dia1 = true
    while i < arr.length - 1
        dia1 = false if arr[i][i] != arr[i + 1][i + 1]
        i += 1
    end

    x = 0
    dia2 = true
    while x < arr.length - 1
        dia2 = false if arr[x][arr[0].length - 1 - x] != arr[x + 1][arr[0].length - 2 - x]
        x += 1
    end
    dia1 || dia2
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

def pascals_triangle(num)
    arr = []
    i = 0
    while i < num
        j = 0
        out = []
        while j <= i
            if i == 0 || j == 0 || arr[i - 1][j - 1].nil? || arr[i - 1][j].nil?
                out << 1
            else
                out << arr[i - 1][j - 1] + arr[i - 1][j]
            end
            j += 1
        end
        i += 1
        arr << out
    end
    arr
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def mersenne_prime(num)
    2.pow(num + 1) - 1
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071

def triangular_word?(str)
    sum = 0
    alpha = ("a".."z").to_a
    str.each_char do |c|
        sum += alpha.index(c) + 1
    end
    is_tri(sum)
end

def is_tri(num)
    (1..num).each do |i|
        return true if i * (i + 1) / 2 == num
    end
    false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    flag = true
    while flag
        flag = false
        (0...arr.length - 1).each do |i|
            if arr[i] == arr[i + 1] + 1 || arr[i] == arr[i + 1] - 1
                arr.delete_at(i)
                arr.delete_at(i + 1)
                flag = true

            end
        end
    end
    arr
end


p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

