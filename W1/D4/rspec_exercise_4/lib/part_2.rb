def proper_factors(num)
    res = []
    (1...num).each do |i|
        res << i if num % i == 0
    end
    res
end

def aliquot_sum(num)
    res = 0
    proper_factors(num).each do |a|
        res += a
    end
    res
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    res = []
    i = 1
    while res.length < num
        res << i if perfect_number?(i)
        i += 1
    end
    res
end