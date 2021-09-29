class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end
  
  def empty?
    @store.empty?
  end
  
  def pop
    @store.pop
  end
  
  def push
    @store.push
  end
  
end