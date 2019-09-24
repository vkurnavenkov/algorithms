# LeetCode 716. Max Stack
#
# Design a max stack that supports push, pop, top, peekMax and popMax.
#
# push(x) -- Push element x onto stack.
# pop() -- Remove the element on top of the stack and return it.
# top() -- Get the element on the top.
# peekMax() -- Retrieve the maximum element in the stack.
# popMax() -- Retrieve the maximum element in the stack, and remove it. If you find more than one maximum elements, only remove the top-most one.
# Example 1:
# MaxStack stack = new MaxStack();
# stack.push(5);
# stack.push(1);
# stack.push(5);
# stack.top(); -> 5
# stack.popMax(); -> 5
# stack.top(); -> 1
# stack.peekMax(); -> 5
# stack.pop(); -> 1
# stack.top(); -> 5
# Note:
# -1e7 <= x <= 1e7
# Number of operations won't exceed 10000.
# The last four operations won't be called when stack is empty.
#

class MaxStack

=begin
    initialize your data structure here.
=end
    def initialize()
        @stack = []
        @max_stack = []
    end


=begin
    :type x: Integer
    :rtype: Void
=end
    def push(x)
        @stack.push(x)
        max_val = peek_max
        if max_val
            max_val = [max_val, x].max
        else
            max_val = x
        end
        @max_stack.push(max_val)
        x
    end


=begin
    :rtype: Integer
=end
    def pop()
        return nil if @stack.empty?

        @max_stack.pop
        @stack.pop
    end


=begin
    :rtype: Integer
=end
    def top()
        @stack.empty? ? nil : @stack.last
    end


=begin
    :rtype: Integer
=end
    def peek_max()
        return nil if @max_stack.empty?

        @max_stack.last
    end


=begin
    :rtype: Integer
=end
    def pop_max()
        return nil if @stack.empty?

        max_val = peek_max
        tmp_stack = []

        while top != max_val
            val = pop
            tmp_stack.push(val)
        end
        pop

        while !tmp_stack.empty?
            val = tmp_stack.pop
            push(val)
        end

        max_val
    end


end

# Your MaxStack object will be instantiated and called as such:
# obj = MaxStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peek_max()
# param_5 = obj.pop_max()
