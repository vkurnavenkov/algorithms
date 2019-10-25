# LeetCode 958. Check Completeness of a Binary Tree
# https://leetcode.com/problems/check-completeness-of-a-binary-tree/
#
# Given a binary tree, determine if it is a complete binary tree.
#
# Definition of a complete binary tree from Wikipedia:
# In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
#
# Example 1:
# Input: [1,2,3,4,5,6]
# Output: true
# Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_complete_tree(root)
    return true unless root

    queue = [root]
    null_found = false
    while !queue.empty?
        node = queue.shift
        if node == nil
            null_found = true
            next
        end
        return false if node && null_found

        queue.push(node.left)
        queue.push(node.right)
    end
    true
end
