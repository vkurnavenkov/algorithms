# Leetcode 222. Count Complete Tree Nodes
#
# Given a complete binary tree, count the number of nodes.
#
# Note:
#
# Definition of a complete binary tree from Wikipedia:
# In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
#
# Example:
#
# Input:
#     1
#    / \
#   2   3
#  / \  /
# 4  5 6
#
# Output: 6
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
        return 0 unless root

        depth = tree_depth(root)
        return 1 if depth == 0

        l = 0
        r = 2 ** depth - 1
        while l <= r
            mid = (l + r) / 2
            if exists?(root, mid, depth)
                l = mid + 1
            else
                r = mid - 1
            end
        end

        2 ** depth - 1 + l
    end

    private

    def tree_depth(root)
        d = 0
        node = root
        while node.left
            d += 1
            node = node.left
        end
        d
    end

    def exists?(root, idx, depth)
        l = 0
        r = 2 ** depth - 1
        node = root
        depth.times do
            mid = (l + r) / 2
            if idx <= mid
                node = node.left
                r = mid
            else
                node = node.right
                l = mid + 1
            end
        end
        node != nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
    Solution.new.solve(root)
end
