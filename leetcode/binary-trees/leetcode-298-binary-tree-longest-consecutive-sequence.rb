# Leetcode 298. Binary Tree Longest Consecutive Sequence
#
# Given a binary tree, find the length of the longest consecutive sequence path.
#
# The path refers to any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The longest consecutive path need to be from parent to child (cannot be the reverse).
#
# Example 1:
#
# Input:
#
#    1
#     \
#      3
#     / \
#    2   4
#         \
#          5
#
# Output: 3
#
# Explanation: Longest consecutive sequence path is 3-4-5, so return 3.
# Example 2:
#
# Input:
#
#    2
#     \
#      3
#     /
#    2
#   /
#  1
#
# Output: 2
#
# Explanation: Longest consecutive sequence path is 2-3, not 3-2-1, so return 2.
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class Solution
    def solve(root)
        @max_length = 0
        dfs(root)
        @max_length
    end

    def dfs(root)
        return 0 unless root

        left_len = dfs(root.left) + 1
        right_len = dfs(root.right) + 1

        left_len = 1 if root.left && root.val + 1 != root.left.val
        right_len = 1 if root.right && root.val + 1 != root.right.val

        cur_length = [left_len, right_len].max
        @max_length = [@max_length, cur_length].max
        cur_length
    end
end

# @param {TreeNode} root
# @return {Integer}
def longest_consecutive(root)
    Solution.new.solve(root)
end
