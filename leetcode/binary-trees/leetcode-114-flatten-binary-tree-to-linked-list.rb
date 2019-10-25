# LeetCode 114. Flatten Binary Tree to Linked List
# https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
#
# Given a binary tree, flatten it to a linked list in-place.
#
# For example, given the following tree:
#
#     1
#    / \
#   2   5
#  / \   \
# 3   4   6
# The flattened tree should look like:
#
# 1
#  \
#   2
#    \
#     3
#      \
#       4
#        \
#         5
#          \
#           6
#

# Solution 1.

class Solution
    def initialize(root)
        @root = root
    end

    def solve
        dfs(@root)
    end

    private

    def dfs(root)
        return nil unless root

        tail = root
        left_tail = dfs(root.left)
        right_tail = dfs(root.right)
        if left_tail
            right = root.right
            root.right = root.left
            left_tail.right = right
        end
        root.left = nil
        right_tail || left_tail || root
    end
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
    Solution.new(root).solve
end

# Solution 2.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
    return unless root;

    flatten(root.right) if root.right

    if root.left
        flatten(root.left)

        l = root.left
        while l.right
            l = l.right
        end

        l.right = root.right
        root.right = root.left
        root.left = nil
    end
end
