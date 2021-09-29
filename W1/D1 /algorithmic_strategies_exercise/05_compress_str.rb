# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    res = ""
    i = 0
    while i < str.length
        cnt = 1
        while str[i] == str[i + 1]
            cnt += 1
            i += 1
        end
        res << cnt.to_s if cnt > 1
        res << str[i]
        i += 1
    end
    res
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"


        
        
