def my_reject(arr, &prc)
    arr.select {|a| !prc.call(a)}
end

def my_one?(arr, &prc)
    cnt = 0
    arr.each do |a|
        cnt += 1 if prc.call(a)
        return false if cnt > 1
    end
    cnt != 0
end

def hash_select(hash, &prc)
    res = Hash.new(0)
    hash.each do |k, v|
        res[k] = v if prc.call(k, v)
    end
    res
end

def xor_select(arr, prc1, prc2)
    res = []
    arr.each do |a|
        res << a if prc1.call(a) && !prc2.call(a) || !prc1.call(a) && prc2.call(a)
    end
    res
end

def proc_count(num, arr)
    res = 0
    arr.each do |a|
        res += 1 if a.call(num)
    end
    res
end
