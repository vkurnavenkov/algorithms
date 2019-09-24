# Leetcode 25. Reverse Nodes in k-Group
#
# Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
#
# k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
#
# Example:
#
# Given this linked list: 1->2->3->4->5
#
# For k = 2, you should return: 2->1->4->3->5
#
# For k = 3, you should return: 3->2->1->4->5
#
# Note:
#
# Only constant extra memory is allowed.
# You may not alter the values in the list's nodes, only nodes itself may be changed.
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
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
    return head if !head || !head.next || k < 2

    result = ListNode.new(0)
    tail = result
    while head
        count = 0
        curr = head
        while curr && count < k
            count += 1
            curr = curr.next
        end

        if count < k
            tail.next = head
            break
        end

        next_tail = head
        tail.next = reverse_list(head, curr)
        tail = next_tail
        head = curr
    end

    result.next
end

def reverse_list(head, next_head)
    result = nil
    while head != next_head
        tmp = head.next
        head.next = result
        result = head
        head = tmp
    end
    result
end
