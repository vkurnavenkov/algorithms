Node = Struct.new(:value, :left, :right)

class Tree
  def initialize(root)
    @root = root
  end

  def print_zigzag
    stack = [@root]
    next_stack = []
    left_to_right = false
    until stack.empty?
      until stack.empty?
        node = stack.pop
        if left_to_right
          next_stack.push(node.left) if node.left
          next_stack.push(node.right) if node.right
        else
          next_stack.push(node.right) if node.right
          next_stack.push(node.left) if node.left
        end
        print "#{node.value} "
      end
      count = stack.size
      left_to_right = !left_to_right
      stack, next_stack = next_stack, stack
    end
  end
end

tree = Tree.new(Node.new(1, Node.new(2, Node.new(7), Node.new(6)), Node.new(3, Node.new(5), Node.new(4))))
tree.print_zigzag
