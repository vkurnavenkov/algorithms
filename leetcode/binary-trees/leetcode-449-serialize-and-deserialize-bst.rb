# LeetCode 449. Serialize and Deserialize BST
#
# Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
#
# Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary search tree can be serialized to a string and this string can be deserialized to the original tree structure.
#
# The encoded string should be as compact as possible.
#
# Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
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
    def serialize(root)
        return "" unless root

        data = postOrder(root, "")
        data.chop
    end

    def deserialize(data)
        return nil if data.empty?

        values = data.split(',').map(&:to_i)
        do_deserialize(values, -1.0 / 0, 1.0 / 0)
    end

    private

    def postOrder(root, data)
        return data unless root;

        data = postOrder(root.left, data)
        data = postOrder(root.right, data)
        data += "#{root.val},"
        return data
    end

    def do_deserialize(values, left, right)
        return nil if values.empty?

        val = values.last
        return nil if val < left || val > right
        values.pop
        node = TreeNode.new(val)
        node.right = do_deserialize(values, val, right)
        node.left = do_deserialize(values, left, val)
        node
    end
end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
    Solution.new.serialize(root)
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
    Solution.new.deserialize(data)
end


# Your functions will be called as such:
# deserialize(serialize(data))
