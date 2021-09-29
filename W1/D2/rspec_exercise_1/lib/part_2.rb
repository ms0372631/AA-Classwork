def hipsterfy(str)
    s = []
    vowels = "aeiou"
    flag = true
    i = str.length - 1
    while i >= 0
        if flag &&vowels.include?(str[i])
            flag = false
        else
            s.unshift(str[i])
        end
        i -= 1
    end
    s.join("")
end


def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    (0...str.length).each do |i|
        if vowels.include?(str[i].downcase)
           hash[str[i].downcase] += 1
        end
    end
    hash
end

def caesar_cipher(str, num )
    alpha = ("a".."z").to_a
    res = ""
    str.each_char do |c|
        if alpha.include?(c)
            res += alpha[(alpha.index(c) + num) % 26]
        else
            res += c
        end
    end
    res
end



