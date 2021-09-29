def element_count(arr)
    hash = Hash.new(0)
    arr.each do |a|
        hash[a] += 1
    end
    return hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |c, i|
       str[i] = hash[c] if hash.key?(c)
    end
    str
end

def product_inject(arr)
    arr.inject {|acc, el| acc * el}
end
