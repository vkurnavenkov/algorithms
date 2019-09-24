# https://leetcode.com/problems/nested-list-weight-sum/description/
#
# Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
#
# Each element is either an integer, or a list -- whose elements may also be integers or other lists.
#
# Example 1:
# Given the list [[1,1],2,[1,1]], return 10. (four 1's at depth 2, one 2 at depth 1)
#
# Example 2:
# Given the list [1,[4,[6]]], return 27. (one 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27)
#

class NestedValue
  attr_reader :value, :children

  def initialize(data)
    if data.is_a?(Array)
      @children = data.map { |v| self.class.new(v) }
      @value = nil
    else
      @children = nil
      @value = data
    end
  end

  def value?
    @value != nil
  end

  def depth_sum_bfs
    result = 0
    queue = [self]
    count = 1
    level = 0
    until queue.empty?
      node = queue.shift
      if node.value?
        result += node.value * level
      else
        node.children.each { |v| queue.push(v) }
      end
      count -= 1
      if count == 0
        count = queue.size
        level += 1
      end
    end
    result
  end

  def depth_sum
    depth_sum_recur(self, 0)
  end

  private

  def depth_sum_recur(node, level)
    return node.value * level if node.value?
    node.children.reduce(0) do |rv, n|
      rv += depth_sum_recur(n, level + 1)
    end
  end
end

tree = NestedValue.new([[1,1],2,[1,1]])
puts tree.depth_sum_bfs # 10
puts tree.depth_sum # 10

tree2 = NestedValue.new([1,[4,[6]]])
puts tree2.depth_sum_bfs # 27
puts tree2.depth_sum # 10
