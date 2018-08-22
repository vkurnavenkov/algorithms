Node = Struct.new(:value, :left, :right)

class BTree
  def initialize
    @root = nil
  end

  def add(parent_node, left_node = nil, right_node = nil)
    if parent_node.nil?
      @root = left_node
    else
      parent_node.left = left_node if left_node
      parent_node.right = right_node if right_node
    end
  end

  def print_horizontal
    return unless @root

    queue = [@root]
    count = 1
    until queue.empty?
      count = queue.size if count == 0
      node = queue.shift
      print "#{node.value} "

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right

      count -= 1
      print "\n" if count == 0
    end
  end

  def print_vertical
    return unless @root

    queue = [[@root, 0]]
    result = Hash.new { |h, k| h[k] = [] }
    min_idx, max_idx = 0, 0

    until queue.empty?
      node, lane = queue.shift
      if lane < min_idx
        min_idx = lane
      elsif lane > max_idx
        max_idx = lane
      end

      result[lane].push(node.value)
      queue.push([node.left, lane - 1]) if node.left
      queue.push([node.right, lane + 1]) if node.right
    end

    (min_idx..max_idx).each do |key|
      puts result[key].join(' ')
    end
  end
end

tree = BTree.new
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
tree.add(nil, node1)
tree.add(node1, node2, node3)
tree.add(node2, Node.new(4), Node.new(5))

node6 = Node.new(6)
node7 = Node.new(7)
tree.add(node3, node6, node7)
tree.add(node6, nil, Node.new(8))
tree.add(node7, nil, Node.new(9))

tree.print_vertical
puts "===================="
tree.print_horizontal
