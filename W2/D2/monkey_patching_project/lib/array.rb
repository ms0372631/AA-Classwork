# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    if self.empty?
        return nil
    end
    self.inject {|acc, el| acc + el} / self.length.to_f
  end

    def median
        if self.empty?
            return nil
        else
            sorted = self.sort
            if self.length % 2 == 0
                return (sorted[self.length / 2] + sorted[self.length / 2 - 1]) / 2.to_f
            else
                return sorted[self.length / 2]
            end
        end
    end

    def counts
        hash = Hash.new(0)
        self.each do |a|
            hash[a] += 1
        end
        hash
    end

    def my_count(num)
        cnt = 0
        self.each do |a|
            cnt += 1 if a == num
        end
        cnt
    end

    def my_index(num)
        if !self.include?(num)
            return nil
        else
            index = 0
            self.each.with_index do |a, i|
                if a == num
                    index = i 
                    break
                end
            end
            index
        end
    end

    def my_uniq
        res = []
        self.each do |a|
            res << a if !res.include?(a)
        end
        res
    end

    def my_transpose
        row = []
        (0...self[0].length).each do |i|
            col = []
            (0...self.length).each do |j|
                col << self[j][i]
            end
            row << col
        end
        row
    end

end
