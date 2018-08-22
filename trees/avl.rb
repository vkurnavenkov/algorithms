Node = Struct.new(:value, :height, :left, :right) do
  def update_height
    height_left = left ? left.height : 0
    height_right = right ? right.height : 0
    self.height = 1 + [height_left, height_right].max
  end
end

class AVL
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    # puts "=== adding #{value} ==="
    @root = insert_helper(@root, value)
  end

  def print_tree
    queue = [@root]
    until queue.empty?
      count = queue.size
      while count > 0
        node = queue.shift
        print "#{node.value}(#{node.height})", " "
        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
        count -= 1
      end
      print "\n"
    end
  end

  private

  def insert_helper(root, value)
    return Node.new(value, 1) unless root

    height_left = 0
    if value < root.value
      root.left = insert_helper(root.left, value)
    elsif value > root.value
      root.right = insert_helper(root.right, value)
    else
      return root
    end
    height_left = root.left ? root.left.height : 0
    height_right = root.right ? root.right.height : 0

    root.height = [height_left, height_right].max + 1

    balance = height_left - height_right
    # puts "balance: #{balance}"
    if root.left && balance > 1
      # unbalanced node, left case, rotate right
      if value > root.left.value
        # left right case
        root.left = rotate_left(root.left)
      end
      root = rotate_right(root)
    elsif root.right && balance < -1
      # unbalanced node, right case, rotate left
      if value < root.right.value
        # right left case
        root.right = rotate_right(root.right)
      end
      root = rotate_left(root)
    end

    root
  end

  def rotate_right(root)
    node = root.left
    root.left = node.right
    node.right = root
    root.update_height
    node.update_height
    node
  end

  def rotate_left(root)
    node = root.right
    root.right = node.left
    node.left = root
    root.update_height
    node.update_height
    node
  end

  def node_height(node)
    node ? node.height : 0
  end
end

avl = AVL.new
avl.insert(13)
avl.insert(10)
avl.insert(5)
avl.insert(4)
avl.insert(6)
avl.insert(11)

avl.insert(16)
avl.insert(15)
puts avl.root

avl.print_tree
