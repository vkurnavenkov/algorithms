# Iterative
def is_symmetric_iterative(root)
    queue = [root, root]
    until queue.empty?
        p1 = queue.shift
        p2 = queue.shift
        next if !p1 && !p2
        return false if !p1 || !p2
        return false if p1.val != p2.val
        queue.push(p1.left, p2.right)
        queue.push(p1.right, p2.left)
    end
    true
end

# Recursion
def is_symmetric_recursion(root)
    queue = [root, root]
    until queue.empty?
        p1 = queue.shift
        p2 = queue.shift
        next if !p1 && !p2
        return false if !p1 || !p2
        return false if p1.val != p2.val
        queue.push(p1.left, p2.right)
        queue.push(p1.right, p2.left)
    end
    true
end
