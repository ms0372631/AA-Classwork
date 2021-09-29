def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    sum = 0.0
    (0...arr.length).each do |i|
        sum += arr[i]
    end
    sum / arr.length
end

def repeat(str, t)
    s = ""
    t.times{ s << str}
    s
end

def yell(str)
    s = ""
    s << str.upcase
    s << "!"
    s
end

def alternating_case(str)
    s = str.split(" ")
    (0...s.length).each do |i|
        if i % 2 == 0
            s[i] = s[i].upcase
        else
            s[i] = s[i].downcase
        end
    end
    s.join(" ")
end

p alternating_case("code never lies, comments sometimes do.")