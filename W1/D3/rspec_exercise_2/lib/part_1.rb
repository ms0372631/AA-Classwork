def partition(arr, num)
    res = []
    smaller = []
    rest = []
    arr.each do |a|
        if a < num
            smaller << a
        else
            rest << a
        end
    end
    res << smaller
    res << rest
    res
end

def merge(hash1, hash2)
    res = Hash.new(0)
    hash1.each do |k, v|
        res[k] = v
    end
    hash2.each do |k, v|
        res[k] = v
    end
    res
end

def censor(string, arr)
    res = []
    vowels = "aeiou"
    words = string.split(" ")
    a = arr.map {|a| a.downcase}
    words.each do |w|
        s = ""
        if a.include?(w.downcase)
            w.each_char do |c|
                if vowels.include?(c.downcase)
                    s << '*'
                else
                    s << c
                end
            end
            res << s
        else
            res << w
        end
    end
    res.join(" ")
end

def power_of_two?(num)
    while num > 1
        return false if num % 2 == 1
        num /= 2
    end
    true
end

            
            