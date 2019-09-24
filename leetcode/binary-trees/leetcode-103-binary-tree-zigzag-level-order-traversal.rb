# LeetCode 103. Binary Tree Zigzag Level Order Traversal
#
# Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
#
# For example:
# Given binary tree [3,9,20,null,null,15,7],
#     3
#    / \
#   9  20
#     /  \
#    15   7
# return its zigzag level order traversal as:
# [
#   [3],
#   [20,9],
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

# Solution 1.
#

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
    return [] unless root

    result = []
    stack = [root]
    dir = true
    while !stack.empty?
        new_stack = []
        cur = []
        while !stack.empty?
            node = stack.pop
            if dir
                new_stack.push(node.left) if node.left
                new_stack.push(node.right) if node.right
            else
                new_stack.push(node.right) if node.right
                new_stack.push(node.left) if node.left
            end
            cur.push(node.val)
        end
        dir = !dir
        result.push(cur)
        stack = new_stack
    end
    result
end

# Solution 2
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
def zigzag_level_order(root)
    return [] unless root

    result = []
    queue = [root]
    dir = true
    while !queue.empty?
        size = queue.size
        cur = []
        size.times do
            node = queue.shift
            if dir
                cur.push(node.val)
            else
                cur.unshift(node.val)
            end
            queue.push(node.left) if node.left
            queue.push(node.right) if node.right
        end
        dir = !dir
        result.push(cur)
    end
    result
end
