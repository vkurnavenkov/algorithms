# LeetCode 102. Binary Tree Level Order Traversal
#
# Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its level order traversal as:
# [
#   [3],
#   [9,20],
#   [15,7]
# ]
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
# @return {Integer[][]}
def level_order(root)
    return [] unless root

    result = []
    queue = [root]
    while !queue.empty?
        size = queue.size
        cur = []
        size.times do
            node = queue.shift
            cur.push(node.val)
            queue.push(node.left) if node.left
            queue.push(node.right) if node.right
        end
        result.push(cur)
    end
    return result
end
