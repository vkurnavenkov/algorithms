Node = Struct.new(:value, :left_idx, :right_idx)

class BTreeCheckerHard
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
    return false if @prev_idx != -1 && (
      tree[@prev_idx].right_idx == root_idx && tree[@prev_idx].value > node.value ||
      tree[@prev_idx].right_idx != root_idx && tree[@prev_idx].value >= node.value
    )


    # return false unless @prev_idx == -1 || node.value > tree[@prev_idx].value
    @prev_idx = root_idx
    valid_bst?(tree, node.right_idx)
  end
end


def bst?(tree, root_idx, min = -1.0/0.0, max = 1.0/0.0)
  return true if root_idx == -1 || tree.empty?

  node = tree[root_idx]
  if node.value < min || node.value >= max
    # puts "Failed on (1): #{root_idx}, #{l_idx}, #{r_idx}. Values: #{tree[root_idx]}, #{tree[l_idx]}, #{tree[r_idx]}"
    return false
  end

  return false unless bst?(tree, node.left_idx, min, node.value)
  return false unless bst?(tree, node.right_idx, node.value, max)

  true
end

def create_tree
  # input = "7 4 1 2 2 3 4 6 5 6 1 -1 -1 3 -1 -1 5 -1 -1 7 -1 -1"
  # input = "4 4 1 -1 2 2 3 1 -1 -1 5 -1 -1" # INCORRECT
  # input = "3 2 1 2 2 -1 -1 3 -1 -1" # INCORRECT (left duplicates)
  # input = "3 1 1 2 2 -1 -1 3 -1 -1" # INCORRECT (left duplicates)
  # input = "3 2 1 2 1 -1 -1 2 -1 -1" # CORRECT (right duplicates)
  # _, *row_data = input.split.map(&:to_i)
  n, *row_data = STDIN.read.chomp.split.map(&:to_i)
  row_data.each_slice(3).map { |val, l_idx, r_idx| Node.new(val, l_idx, r_idx) }.slice(0, n)
end

tree = create_tree
puts BTreeCheckerHard.new(tree).bst? ? 'CORRECT' : 'INCORRECT'

# puts bst?(tree, 0) ? 'CORRECT' : 'INCORRECT'
