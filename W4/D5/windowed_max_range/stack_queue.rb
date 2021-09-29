require_relative 'my_stack'


class StackQueue < MyStack
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def size
  @in_stack.length + @out_stack.length
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

  def enqueue(item)
    @in_stack.push(item)
  end

  def dequeue(item)
    @fill_out_stack if @out_stack.empty?

    out_stack.pop
  end

  private

  def fill_out_stack
    @out_stack.push(@in_stack.pop) until @in_stack.empty?
  end
  
  
end