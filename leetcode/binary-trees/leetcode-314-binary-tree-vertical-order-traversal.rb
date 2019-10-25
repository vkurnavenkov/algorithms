# LeetCode 314. Binary Tree Vertical Order Traversal
# https://leetcode.com/problems/binary-tree-vertical-order-traversal/
#
# Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).
#
# If two nodes are in the same row and column, the order should be from left to right.
#
# Examples 1:
#
# Input: [3,9,20,null,null,15,7]
#
#    3
#   /\
#  /  \
#  9  20
#     /\
#    /  \
#   15   7
#
# Output:
#
# [
#   [9],
#   [3,15],
#   [20],
#   [7]
# ]
# Examples 2:
#
# Input: [3,9,8,4,0,1,7]
#
#      3
#     /\
#    /  \
#    9   8
#   /\  /\
#  /  \/  \
#  4  01   7
#
# Output:
#
# [
#   [4],
#   [9],
#   [3,0,1],
#   [8],
#   [7]
# ]
# Examples 3:
#
# Input: [3,9,8,4,0,1,7,null,null,null,2,5] (0's right child is 2 and 1's left child is 5)
#
#      3
#     /\
#    /  \
#    9   8
#   /\  /\
#  /  \/  \
#  4  01   7
#     /\
#    /  \
#    5   2
#
# Output:
#
# [
#   [4],
#   [9,5],
#   [3,0,1],
#   [8,2],
#   [7]
# ]
#

class Solution
    attr_reader :root

    def initialize(root)
        @root = root
    end

    def solve
        return [] unless root

        @min_col = 0
        @max_col = 0
        map = {}
        traverse(root, map, 0)

        result = []
        (@min_col..@max_col).each do |i|
            result.push(map[i])
        end
        result
    end

    private

    def traverse(root, map, col)
        return unless root

        queue = [[root, 0]]
        while !queue.empty?
            node, col = queue.shift
            @min_col = [@min_col, col].min
            @max_col = [@max_col, col].max
            map[col] = [] unless map.key?(col)
            map[col].push(node.val)
            queue.push([node.left, col - 1]) if node.left
            queue.push([node.right, col + 1]) if node.right
        end
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
# @return {Integer[][]}
def vertical_order(root)
    Solution.new(root).solve
end
