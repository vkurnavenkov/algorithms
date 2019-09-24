Node = Struct.new(:value, :left_idx, :right_idx)

def in_order_traversal(tree, root_idx)
  return [] if root_idx == -1

  result = []

  unless tree[root_idx].left_idx == -1
    result += in_order_traversal(tree, tree[root_idx].left_idx)
  end
  result << tree[root_idx].value
  unless tree[root_idx].right_idx == -1
    result += in_order_traversal(tree, tree[root_idx].right_idx)
  end

  result
end

def in_order_traversal_stack(tree)
  return [] if tree.empty?

  result = []
  stack = []
  cur_idx = 0

  begin
    if cur_idx != -1
      stack.push(cur_idx)
      cur_idx = tree[cur_idx].left_idx
    else
      node = tree[stack.pop]
      result.push(node.value)
      cur_idx = node.right_idx
    end
  end until stack.empty? && cur_idx == -1

  result
end

def pre_order_traversal(tree, root_idx)
  return [] if root_idx == -1

  result = []

  result << tree[root_idx].value
  unless tree[root_idx].left_idx == -1
    result += pre_order_traversal(tree, tree[root_idx].left_idx)
  end
  unless tree[root_idx].right_idx == -1
    result += pre_order_traversal(tree, tree[root_idx].right_idx)
  end

  result
end

def pre_order_traversal_stack(tree)
  return [] if tree.empty?

  result = []
  stack = [0]
  cur_idx = 0

  until stack.empty?
    node = tree[stack.pop]
    result.push(node.value)
    stack.push(node.right_idx) if node.right_idx != -1
    stack.push(node.left_idx) if node.left_idx != -1
  end

  result
end

def post_order_traversal(tree, root_idx)
  return [] if root_idx == -1

  result = []

  unless tree[root_idx].left_idx == -1
    result += post_order_traversal(tree, tree[root_idx].left_idx)
  end
  unless tree[root_idx].right_idx == -1
    result += post_order_traversal(tree, tree[root_idx].right_idx)
  end
  result << tree[root_idx].value

  result
end

def post_order_traversal_stack(tree)
  return [] if tree.empty?

  result = []
  cur_idx = 0
  stack = []
  begin
    while cur_idx != -1
      stack.push(tree[cur_idx].right_idx) unless tree[cur_idx].right_idx == -1
      stack.push(cur_idx)
      cur_idx = tree[cur_idx].left_idx
    end

    idx = stack.pop
    node = tree[idx]
    if node.right_idx && node.right_idx == stack[-1]
      cur_idx = stack.pop
      stack.push(idx)
    else
      result.push(node.value)
    end
  end until stack.empty?

  result
end


def create_tree
  # input = "5 4 1 2 2 3 4 5 -1 -1 1 -1 -1 3 -1 -1"
  # _, *row_data = input.split.map(&:to_i)
  _, *row_data = STDIN.read.split.map(&:to_i)
  row_data.each_slice(3).map { |val, l_idx, r_idx| Node.new(val, l_idx, r_idx) }
end

tree = create_tree
puts in_order_traversal_stack(tree).join(' ')
puts pre_order_traversal_stack(tree).join(' ')
puts post_order_traversal_stack(tree).join(' ')

# puts in_order_traversal(tree, 0).join(' ')
# puts pre_order_traversal(tree, 0).join(' ')
# puts post_order_traversal(tree, 0).join(' ')
