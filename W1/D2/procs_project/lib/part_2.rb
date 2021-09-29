def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    res = []
    str.split(" ").each do |a|
        res << prc.call(a)
    end
    res.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    [prc1.call(num), prc2.call(num)].max
end

def and_selector(arr, prc1, prc2)
    res = []
    arr.each do |a|
        res << a if prc1.call(a) && prc2.call(a)
    end
    res
end

def alternating_mapper(arr, prc1, prc2)
    res = []
    arr.each_with_index do |a, i|
        if i % 2 == 0
            res << prc1.call(a)
        else
            res << prc2.call(a)
        end
    end
    res
end
