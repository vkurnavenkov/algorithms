# LeetCode 272. Closest Binary Search Tree Value II
#
# Given a non-empty binary search tree and a target value, find k values in the BST that are closest to the target.
#
# Note:
#
# Given target value is a floating point.
# You may assume k is always valid, that is: k ≤ total nodes.
# You are guaranteed to have only one unique set of k values in the BST that are closest to the target.
# Example:
#
# Input: root = [4,2,5,1,3], target = 3.714286, and k = 2
#
#     4
#    / \
#   2   5
#  / \
# 1   3
#
# Output: [4,3]
# Follow up:
# Assume that the BST is balanced, could you solve it in less than O(n) runtime (where n = total nodes)?
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

MAX_FLOAT = 1.0/0

# @param {TreeNode} root
# @param {Float} target
# @param {Integer} k
# @return {Integer[]}
def closest_k_values(root, target, k)
    return [] if root.nil? || k == 0

    list = []
    left_stack = []
    right_stack = []
    node = root
    while node
        if node.val > target
            right_stack.push(node)
            node = node.left
        else
            left_stack.push(node)
            node = node.right
        end
    end

    left_node = left_stack.pop
    right_node = right_stack.pop
    while list.size < k
        left_dist = left_node ? target - left_node.val : MAX_FLOAT
        right_dist = right_node ? right_node.val - target : MAX_FLOAT
        if right_dist < left_dist
            list.push(right_node.val)
            right_node = nextRightNode(right_node, right_stack)
        else
            list.push(left_node.val)
            left_node = nextLeftNode(left_node, left_stack)
        end
    end

    list
end

def nextRightNode(node, stack)
    node = node.right
    while node
        stack.push(node)
        node = node.left
    end
    stack.pop
end

def nextLeftNode(node, stack)
    node = node.left
    while node
        stack.push(node)
        node = node.right
    end
    stack.pop
end
