Node = Struct.new(:value, :left, :right)

class Tree
  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_node(value, @root)
  end

  def delete(value)
    @root = delete_node(value, @root)
  end

  def print_inorder
    node_print_inorder(@root)
    print "\n"
  end

  private

  def insert_node(val, node)
    return Node.new(val) unless node
    if val < node.value
      node.left = insert_node(val, node.left)
    elsif val > node.value
      node.right = insert_node(val, node.right)
    end
    node
  end

  def delete_node(val, node)
    return nil unless node
    if val < node.value
      node.left = delete_node(val, node.left)
    elsif val > node.value
      node.right = delete_node(val, node.right)
    else
      if node.left == nil || node.right == nil
        return node.left || node.right
      end
      min_node = find_min_node(node.right)
      node.value = min_node.value
      node.right = delete_node(min_node.value, node.right)
    end
    node
  end

  def find_min_node(node)
    cur = node
    while cur.left
      cur = cur.left
    end
    cur
  end

  def node_print_inorder(node)
    return unless node
    node_print_inorder(node.left)
    print "#{node.value} "
    node_print_inorder(node.right)
  end
end

tree = Tree.new
tree.insert(50)
tree.insert(30)
tree.insert(70)
tree.insert(20)
tree.insert(40)
tree.insert(60)
tree.insert(80)
tree.print_inorder

tree.delete(20)
tree.print_inorder

tree.delete(30)
tree.print_inorder

tree.delete(50)
tree.print_inorder
