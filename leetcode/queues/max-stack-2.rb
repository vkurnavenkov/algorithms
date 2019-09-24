class MaxStack
  # initialize your data structure here.
  def initialize()
    @stack = []
    @max_value = nil
  end

  # :type x: Integer
  # :rtype: Void
  def push(x)
    if empty?
      @max_value = x
    elsif x > @max_value
      max = x
      x = 2 * x - @max_value
      @max_value = max
    end
    @stack.push(x)
  end

  # :rtype: Integer
  def pop
    return nil if empty?
    v = @stack.pop
    if v > @max_value
      max = @max_value
      @max_value = 2 * max - v
      v = max
    end
    @max_value = nil if empty?
    v
  end

  # :rtype: Integer
  def top
    return nil if empty?
    v = @stack[-1]
    v > @max_value ? @max_value : v
  end

  # :rtype: Integer
  def peek_max
    @max_value
  end

  # :rtype: Integer
  def pop_max
    # max = @max_value
    # pop
    # max
  end

  def empty?
    @stack.empty?
  end
end

# Your MaxStack object will be instantiated and called as such:
obj = MaxStack.new()
[2, 1, 5, 3, 9].each { |v| obj.push(v) }

puts obj.pop # 9
puts obj.top # 3
puts obj.peek_max # 5
puts obj.pop # 3
puts obj.top # 5
puts obj.peek_max # 5
puts obj.pop # 5
puts obj.top # 1
puts obj.peek_max # 2
# puts obj.pop_max() # 3
# puts obj.pop_max() # 2
