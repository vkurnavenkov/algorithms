# Leetcode 124. Binary Tree Maximum Path Sum
# Given a non-empty binary tree, find the maximum path sum.
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def cur_max_sum(root)
  return 0 unless root
  left_cur_max = cur_max_sum(root.left)
  right_cur_max = cur_max_sum(root.right)
  cur_max = [left_cur_max, right_cur_max, left_cur_max + right_cur_max, 0].max + root.val
  $maximum = cur_max if cur_max > $maximum
  [left_cur_max, right_cur_max, 0].max + root.val
end

# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  $maximum = -1.fdiv(0)
  cur_max_sum(root)
  $maximum
end
