class MaxStack
  # initialize your data structure here.
  def initialize()
    @stack = []
    @max_stack = []
  end

  # :type x: Integer
  # :rtype: Void
  def push(x)
    max = @max_stack.empty? ? x : [x, @max_stack[-1]].max
    @max_stack.push(max)
    @stack.push(x)
  end

  # :rtype: Integer
  def pop
    return nil if @stack.empty?
    @max_stack.pop
    @stack.pop
  end

  # :rtype: Integer
  def top
    @stack.empty? ? nil : @stack[-1]
  end

  # :rtype: Integer
  def peek_max
    @max_stack.empty? ? nil : @max_stack[-1]
  end

  # :rtype: Integer
  def pop_max
    max = peek_max
    return nil unless max
    buf = []
    while top != max
      buf.push(pop)
    end
    pop
    until buf.empty?
      push(buf.pop)
    end
    max
  end
end

# Your MaxStack object will be instantiated and called as such:
obj = MaxStack.new()
[2, 1, 5, 3, 9].each { |v| obj.push(v) }

puts obj.pop() # 9
puts obj.top() # 3
puts obj.peek_max() # 5
puts obj.pop_max() # 5
puts obj.pop_max() # 3
