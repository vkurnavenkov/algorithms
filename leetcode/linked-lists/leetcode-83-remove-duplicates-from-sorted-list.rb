# Leetcode 83. Remove Duplicates from Sorted List
#
# Given a sorted linked list, delete all duplicates such that each element appear only once.
#
# Example 1:
#
# Input: 1->1->2
# Output: 1->2
# Example 2:
#
# Input: 1->1->2->3->3
# Output: 1->2->3
#

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
    return nil unless head

    prev = head
    cur = prev.next
    while cur != nil
        if cur.val == prev.val
            prev.next = cur.next
        else
            prev = cur
        end
        cur = cur.next
    end
    head
end
