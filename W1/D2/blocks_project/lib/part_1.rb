def select_even_nums(arr)
    res = arr.select {|a| a.even?}
    res
end

def reject_puppies(hash)
    res = hash.reject {|h| h["age"] <= 2}
    res
end

def count_positive_subarrays(arr)
    res = arr.count {|a| a.sum > 0}
    res
end

def aba_translate(str)
    res = ""
    vowels = "aeiou"
    str.each_char do |c|
        res += c
        res += "b" + c if vowels.include?(c)
    end
    res
end

def aba_array(arr)
    res = arr.map {|a| aba_translate(a)}
    res
end
