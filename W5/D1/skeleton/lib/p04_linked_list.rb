class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  attr_reader :head, :tail

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next
  end

  def last
    tail.prev
  end

  def empty?
    return true if self.length == 2
    false
  end

  def get(key)
    cur = head.next
    until cur.value == nil
      return cur.value if cur.key == key
      cur = cur.next
    end
    return nil
  end

  def include?(key)
    cur = head.next
    until cur.value == nil
      return true if cur.key == key
      cur = cur.next
    end
    return false
  end

  def append(key, val)
    key = Node.new(key, val)
    key.prev = tail.prev
    tail.prev.next = key
    tail.prev = key
    # old tail.prev.next = new node
    # new node tail as next
    # old tail.prev as prev
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
