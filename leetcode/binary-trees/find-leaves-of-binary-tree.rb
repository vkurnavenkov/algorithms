Node = Struct.new(:value, :left, :right) do
  def leaf?
    left == nil && right == nil
  end
end

class Tree
  def initialize(root)
    @root = root
  end

  def find_leaves
    results = []
    while @root
      result = []
      @root = traverse(@root, result)
      results.push(result)
    end
    results
  end

  private

  def traverse(root, result)
    return nil if root == nil
    if root.leaf?
      result.push(root.value)
      return nil
    end
    root.left = traverse(root.left, result)
    root.right = traverse(root.right, result)
    root
  end
end

tree = Tree.new(
  Node.new(1,
    Node.new(
      2, Node.new(4), Node.new(5)
    ),
    Node.new(3)
  )
)

puts tree.find_leaves.to_s
