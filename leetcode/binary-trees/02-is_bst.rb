Node = Struct.new(:value, :left_idx, :right_idx)

class BTreeChecker
  def initialize(tree)
    @tree = tree
  end

  def bst?
    return true if @tree.empty?
    @prev_idx = -1
    valid_bst?(@tree, 0)
  end

  private

  def valid_bst?(tree, root_idx)
    return true if root_idx == -1

    node = tree[root_idx]
    return false unless valid_bst?(tree, node.left_idx)

    # puts "Node: #{root_idx}:#{node.value}, Prev: #{@prev_idx}:#{tree[@prev_idx].value}"
    # return false if @prev_idx != -1 && node.value <= tree[@prev_idx].value
    return false unless @prev_idx == -1 || node.value > tree[@prev_idx].value
    @prev_idx = root_idx
    valid_bst?(tree, node.right_idx)
  end
end


def bst?(tree, root_idx, l_idx = -1, r_idx = -1)
  return true if root_idx == -1 || tree.empty?

  node = tree[root_idx]

  if l_idx != -1 && node.value < tree[l_idx].value
    # puts "Failed on (1): #{root_idx}, #{l_idx}, #{r_idx}. Values: #{tree[root_idx]}, #{tree[l_idx]}, #{tree[r_idx]}"
    return false
  end
  if r_idx != -1 && node.value >= tree[r_idx].value
    # puts "Failed on (2): #{root_idx}, #{l_idx}, #{r_idx}. Values: #{tree[root_idx]}, #{tree[l_idx]}, #{tree[r_idx]}"
    return false
  end

  return false unless bst?(tree, node.left_idx, l_idx, root_idx)
  return false unless bst?(tree, node.right_idx, root_idx, r_idx)

  true
end

def create_tree
  # input = "7 4 1 2 2 3 4 6 5 6 1 -1 -1 3 -1 -1 5 -1 -1 7 -1 -1"
  # input = "4 4 1 -1 2 2 3 1 -1 -1 5 -1 -1" # INCORRECT
  # _, *row_data = input.split.map(&:to_i)
  n, *row_data = STDIN.read.chomp.split.map(&:to_i)
  row_data.each_slice(3).map { |val, l_idx, r_idx| Node.new(val, l_idx, r_idx) }.slice(0, n)
end

tree = create_tree
puts BTreeChecker.new(tree).bst? ? 'CORRECT' : 'INCORRECT'

# puts bst?(tree, 0) ? 'CORRECT' : 'INCORRECT'
