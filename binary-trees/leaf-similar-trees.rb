# Leetcode 872. Leaf-Similar Trees
#
# Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.
#
#
#
# For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).
#
# Two binary trees are considered leaf-similar if their leaf value sequence is the same.
#
# Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
#
#
#
# Note:
#
# Both of the given trees will have between 1 and 100 nodes.
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def traverse(root, leaves)
    return leaves unless root
    return leaves.push(root.val) if !root.left && !root.right
    traverse(root.left, leaves)
    traverse(root.right, leaves)
    leaves
end

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def leaf_similar(root1, root2)
    leaves1 = traverse(root1, [])
    leaves2 = traverse(root2, [])
    leaves1 == leaves2
end
