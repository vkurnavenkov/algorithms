# LeetCode 255. Verify Preorder Sequence in Binary Search Tree
# https://leetcode.com/problems/verify-preorder-sequence-in-binary-search-tree/
#
# Given an array of numbers, verify whether it is the correct preorder traversal sequence of a binary search tree.
#
# You may assume each number in the sequence is unique.
#
# Consider the following binary search tree:
#
#      5
#     / \
#    2   6
#   / \
#  1   3
# Example 1:
#
# Input: [5,2,6,1,3]
# Output: false
# Example 2:
#
# Input: [5,2,1,3,6]
# Output: true
# Follow up:
# Could you do it using only constant space complexity?
#

# Solution 1.
#

# @param {Integer[]} preorder
# @return {Boolean}
def verify_preorder(preorder)
    max_val = -1.0 / 0
    stack = []
    i = 0
    preorder.each do |v|
        return false if v < max_val
        if stack.empty? || stack[-1] > v
            stack.push(v)
        else
            while !stack.empty? && stack[-1] < v
                val = stack.pop
                max_val = [max_val, val].max
            end

            stack.push(v)
        end
    end

    true
end

# Solution 2.
#

class Solution
    def solve(preorder)
        @idx = 0
        helper(preorder, -1.0 / 0, 1.0 / 0)
    end

    private

    def helper(preorder, left, right)
        return true if @idx == preorder.size

        val = preorder[@idx]
        return false if val < left || val > right

        @idx += 1
        helper(preorder, left, val - 1) ||
            helper(preorder, val + 1, right)
    end
end

# @param {Integer[]} preorder
# @return {Boolean}
def verify_preorder(preorder)
    Solution.new.solve(preorder)
end
