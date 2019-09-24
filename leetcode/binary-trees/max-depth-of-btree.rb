def max_depth_bfs(root)
    return 0 if root == nil
    queue = [root]
    count = 1
    level = 0
    until queue.empty?
      node = queue.shift
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
      count -= 1
      if count == 0
        count = queue.size
        level += 1
      end
    end
    level
end

def max_depth(root, level = 0)
    return level if root == nil
    l_depth = max_depth(root.left, level + 1)
    r_depth = max_depth(root.right, level + 1)
    [l_depth, r_depth].max
end
