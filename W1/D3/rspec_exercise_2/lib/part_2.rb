def palindrome?(str)
    left = 0
    right = str.length - 1
    while left < right
        return false if str[left] != str[right]
        left += 1
        right -= 1
    end
    true
end

def substrings(str)
    res = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            s = ""
            x = i
            while x <= j
                s << str[x]
                x += 1
            end
            res << s
        end
    end
    res
end

def palindrome_substrings(str)
    substrings(str).select {|s| s.length > 1 && palindrome?(s)}
end


