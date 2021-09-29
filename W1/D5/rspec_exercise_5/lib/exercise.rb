def zip(*arr)
    row = []
    sz = arr[0].length
    (0...sz).each do |i|
        col = []
        arr.each do |a|
            col << a[i]
        end
        row << col
    end
    row
end

def prizz_proc(arr, prc1, prc2)
    res = []
    arr.each do |a|
        res << a if prc1.call(a) && !prc2.call(a) || !prc1.call(a) && prc2.call(a)
    end
    res
end

def zany_zip(*arr)
    sz = 0
    arr.each do |a|
        sz = [a.length, sz].max
    end

    row = []
    (0...sz).each do |i|
        col = []
        arr.each do |a|
            if i > a.length - 1
                col << nil
            else
                col << a[i]
            end
        end
        row << col
    end
    row
end

def maximum(arr, &prc)
    res = 0
    max = 0
    arr.each do |a|
        if prc.call(a) >= max
            max = prc.call(a)
            res = a
        end
    end
    arr.empty? ? nil : res
end

def my_group_by(arr, &prc)

    hash = Hash.new{|h, k| h[k] = []}
    arr.each do |a|
        hash[prc.call(a)] << a
    end
    hash
end

def max_tie_breaker(arr, prc, &blk)
    res = ""
    mx1 = 0
    arr.each do |a|
        mx1 = [blk.call(a), mx1].max
    end
    same = []
    arr.each do |a|
        same << a if blk.call(a) == mx1
    end
    return same[0] if same.length == 1
    mx2 = 0
    res = []
    same.each do |a|
        mx2 = [prc.call(a), mx2].max
    end
    same.each do |a|
        res << a if prc.call(a) == mx2
    end
    res[0]
end

def silly_syllables(str)
    vowels = "aeiou"
    res = []
    str.split(" ").each do |w|
        cnt = 0
        first = -1
        last = 0
        w.each_char.with_index do |c, i|
            if vowels.include?(c)
                cnt += 1
                first = i if first == -1
                last = i
            end    
        end
        if cnt < 2
            res << w
        else
            res << w[first..last]
        end
    end
    res.join(" ")
end

