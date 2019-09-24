Node = Struct.new(:value, :left_idx, :right_idx)

class BTree
  def initialize
  end
end

def print_tree(tree)
  cur_level = 0
  queue = [[0, cur_level]]
  # cur_idx = 0

  until queue.empty?
    idx, level = queue.shift
    if level != cur_level
      cur_level = level
      print "\n"
    end
    node = tree[idx]
    print node.value, ' '
    queue.push([node.left_idx, cur_level + 1]) if node.left_idx != -1
    queue.push([node.right_idx, cur_level + 1]) if node.right_idx != -1
  end
  print "\n"
end

def create_tree
  # input = "5 4 1 2 2 3 4 5 -1 -1 1 -1 -1 3 -1 -1"
  input = "13
9 1 2
6 3 4
12 5 6
4 7 8
8 9 -1
10 -1 10
15 11 12
7 -1 -1
5 -1 -1
7 -1 -1
11 -1 -1
13 -1 -1
16 -1 -1
"
  n, *row_data = input.split.map(&:to_i)
  # _, *row_data = STDIN.read.split.map(&:to_i)
  row_data.each_slice(3).map { |val, l_idx, r_idx| Node.new(val, l_idx, r_idx) }.slice(0, n)
end

tree = create_tree
puts "#{tree}"

print_tree(tree)
