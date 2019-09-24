# LeetCode 173. Binary Search Tree Iterator
#
# Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
#
# Calling next() will return the next smallest number in the BST.
#
# Example:
#
# BSTIterator iterator = new BSTIterator(root);
# iterator.next();    // return 3
# iterator.next();    // return 7
# iterator.hasNext(); // return true
# iterator.next();    // return 9
# iterator.hasNext(); // return true
# iterator.next();    // return 15
# iterator.hasNext(); // return true
# iterator.next();    // return 20
# iterator.hasNext(); // return false
#
# Note:
#
# next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
# You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
#

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator

=begin
    :type root: TreeNode
=end
    def initialize(root)
        @root = root
        @current_value = nil
    end


=begin
    @return the next smallest number
    :rtype: Integer
=end
    def next()
        @current_value = find_in_range(@root, @current_value)
    end


=begin
    @return whether we have a next smallest number
    :rtype: Boolean
=end
    def has_next()
        find_in_range(@root, @current_value) != nil
    end

    private

    def find_in_range(root, min_value)
        node = root
        value = nil

        while node
            if min_value == nil || node.val > min_value
                value = node.val if value == nil || node.val < value
                node = node.left
            else
                node = node.right
            end
        end

        return value
    end
end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()
