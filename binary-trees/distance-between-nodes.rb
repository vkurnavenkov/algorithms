Node = Struct.new(:value, :left, :right)

class Tree
  def initialize(root)
    @root = root
  end

  def distance(val1, val2)
    node = lca(@root, val1, val2)
    level1 = find_level(node, val1)
    level2 = find_level(node, val2)
    level1 == nil || level2 == nil ? nil : level1 + level2
  end

  private

  def find_level(root, val, level = 0)
    return nil unless root
    return level if root.value == val
    find_level(root.left, val, level + 1) ||
      find_level(root.right, val, level + 1)
  end

  def lca(root, val1, val2)
    return root if root == nil || root.value == val1 || root.value == val2
    left = lca(root.left, val1, val2)
    right = lca(root.right, val1, val2)
    return root if left && right
    left || right
  end

end

root = Node.new(1, Node.new(2, Node.new(4), Node.new(5)), Node.new(3, Node.new(6, nil, Node.new(8)), Node.new(7)))
tree = Tree.new(root)
puts tree.distance(2, 3) # 2
puts tree.distance(2, 4) # 1
puts tree.distance(4, 5) # 2
puts tree.distance(4, 10) # nil
puts tree.distance(8, 5) # 5
