# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    i = num
        while (i >= 2)
            return i if num % i == 0 && is_prime(i)
            i -= 1
        end
    return 2
end

def is_prime(num)
    return false if num < 2
    (2...num).each do |i|
         return false if num % i == 0
    end
    true
end

def unique_chars?(str)
    s = ""
    str.each_char do |c|
        return false if s.include?(c)
        s << c
    end
    true
end

def dupe_indices(array)

    hash = Hash.new { |h, k| h[k] = []}
    array.each_with_index do |a, i|
        hash[a] << i
    end
    res = hash.select {|k, v| v.length > 1}
    res
end


def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each do |a|
        hash1[a] += 1
    end

    arr2.each do |a|
        hash2[a] += 1
    end
    hash1 == hash2
end