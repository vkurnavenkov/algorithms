# Leetcode 113. Path Sum II
# Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
#
# Note: A leaf is a node with no children.
#
# Example:
#
# Given the below binary tree and sum = 22,
#
# Binary tree: [5,4,8,11,null,13,4,7,2,null,null,5,1]
#
# Return:
#
# [
#    [5,4,11,2],
#    [5,8,4,5]
# ]

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def helper(root, sum, result, results)
    return results if root.nil?
    if root.left.nil? && root.right.nil?
        if sum == root.val
            result.push(root.val)
            results.push(result.dup)
            result.pop
        end
        return results
    end
    result.push(root.val)
    helper(root.left, sum - root.val, result, results)
    helper(root.right, sum - root.val, result, results)
    result.pop
    results
end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
    return [] if root.nil?
    results = []
    helper(root, sum, [], results)
end
