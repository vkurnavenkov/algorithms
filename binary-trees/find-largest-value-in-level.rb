def largest_values_bfs(root)
    return [] if root == nil
    results = []
    queue = [root]
    count = 1
    level = 0
    max_value = -1.fdiv(0)
    until queue.empty?
      node = queue.shift
      max_value = node.val if max_value < node.val
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
      count -= 1
      if count == 0
        count = queue.size
        results.push(max_value)
        max_value = -1.fdiv(0)
        level += 1
      end
    end
    results
end

def traverse(root, level, result)
  return unless root
  result[level] = root.val if result[level] == nil || result[level] < root.val
  traverse(root.left, level + 1, result)
  traverse(root.right, level + 1, result)
end

def largest_values(root)
  result = []
  traverse(root, 0, result)
  result
end
