class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? {|a| POSSIBLE_PEGS.has_key?(a.upcase)}
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map {|a| a.upcase}
    else
      raise "not valid"
    end
  end

  def self.random(num)
    res = []
    num.times {res << POSSIBLE_PEGS.keys.sample}
    Code.new(res)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    cnt = 0
    (0...@pegs.length).each do |i|
      cnt += 1 if @pegs[i] == code.pegs[i]
    end
    cnt
  end

  def num_near_matches(code)
    c1 = []
    c2 = []
    (0...@pegs.length).each do |i|
      if @pegs[i] != code.pegs[i]
        c1 << @pegs[i]
        c2 << code.pegs[i]
      end
    end
    cnt = 0
    (0...c1.uniq.length).each do |i|
      cnt += 1 if c2.uniq.include?(c1[i])
    end
    cnt
  end
  
  def ==(code)
    code == self.pegs
  end


end
