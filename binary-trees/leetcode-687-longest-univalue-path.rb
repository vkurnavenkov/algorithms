# Leetcode 687. Longest Univalue Path
#
# Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
#
# The length of path between two nodes is represented by the number of edges between them.
#
#
# Example 1:
#
# Input:
#
#               5
#              / \
#             4   5
#            / \   \
#           1   1   5
# Output: 2
#
#
# Example 2:
#
# Input:
#
#               1
#              / \
#             4   5
#            / \   \
#           4   4   5
# Output: 2
#
# Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.
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
        @max_length = 0;
        dfs(root)
        @max_length
    end

    private

    def dfs(root)
        return 0 unless root

        left_len = dfs(root.left);
        right_len = dfs(root.right);

        left_len = root.left && root.val == root.left.val ? left_len + 1 : 0
        right_len = root.right && root.val == root.right.val ? right_len + 1 : 0

        @max_length = [@max_length, left_len + right_len].max
        [left_len, right_len].max
    end
end

# @param {TreeNode} root
# @return {Integer}
def longest_univalue_path(root)
    Solution.new.solve(root)
end
