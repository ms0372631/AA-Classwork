class MaxIntSet

  attr_reader :store, :max

  def initialize(max)
    @max = max
    @store = Array.new(@max, false) 
  end

  def insert(num)
    if num > max || num < 0
      raise 'Out of bounds'
    else
      store[num] = true
    end
  end

  def remove(num)
    store[num] = false if store[num]
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet

attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      if count == num_buckets
        resize!
      end
      self[num].push(num)
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    temp.each do |t|
      t.each do |num|
        self[num].push(num)
      end
    end
  end
end
