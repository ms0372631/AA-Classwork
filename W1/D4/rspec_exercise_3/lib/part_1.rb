def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def nth_prime(num)
    cnt = 0
    i = 2
    while true
        cnt += 1 if is_prime(i)
        break if cnt == num
        i += 1
    end
    i
end

def is_prime(num)
    (2...num).each do |i|
        return false if num % i == 0
    end
    true
end

def prime_range(min, max)
    return [] if min < 0 || max < 0
    res = []
    (min..max).each do |i|
        res << i if is_prime(i)
    end
    res
end
            