# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find_path(root, p, path)
    return false unless root
    path.push(root)
    return true if root.val == p.val || find_path(root.left, p, path) || find_path(root.right, p, path)
    path.pop
    false
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    path1 = []
    path2 = []
    find_path(root, p, path1)
    puts path1.map{|v| v.val}.to_s

    find_path(root, q, path2)
    puts path2.map{|v| v.val}.to_s
    return nil if !find_path(root, p, path1) || !find_path(root, q, path2)
    idx = 0
    while path1[idx] == path2[idx]
        idx += 1
    end
    path1[idx - 1]
end

# Recursion solution
def lca(root, p, q)
    return nil unless root
    return root if root == p || root == q
    left = lca(root.left, p, q)
    right = lca(root.right, p, q)
    return root if left && right
    left || right
end
