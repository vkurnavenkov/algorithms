# Leetcode 24. Swap Nodes in Pairs
#
# Given a linked list, swap every two adjacent nodes and return its head.
#
# You may not modify the values in the list's nodes, only nodes itself may be changed.
#
# Example:
#
# Given 1->2->3->4, you should return the list as 2->1->4->3.
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
def swap_pairs(head)
    return head if !head || !head.next

    result = ListNode.new(1)
    tail = result
    while head && head.next
        tail.next = head.next
        head.next = tail.next.next
        tail.next.next = head
        head = head.next
        tail = tail.next.next
    end
    result.next
end
