class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !self.include?(key.hash)
      if count == num_buckets
        resize!
      end
      self[key.hash].push(key)
      @count += 1
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    temp.each do |t|
      t.each do |num|
        self[num.hash].push(num)
      end
    end
  end
end
