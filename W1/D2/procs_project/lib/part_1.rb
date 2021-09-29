def my_map(array, &prc)
    res = []
    array.each do |a|
        res << prc.call(a)
    end
    res
end

def my_select(array, &prc)
    res = []
    array.each do |a|
        res << a if prc.call(a)
    end
    res
end

def my_count(array, &prc)
    cnt = 0
    array.each do |a|
        cnt += 1 if prc.call(a)
    end
    cnt
end

def my_any?(array, &prc)
    array.each do |a|
        return true if prc.call(a)
    end
    false
end

def my_all?(array, &prc)
    array.each do |a|
        return false if !prc.call(a)
    end
    true
end

def my_none?(array, &prc)
    array.each do |a|
        return false if prc.call(a)
    end
    true
end
