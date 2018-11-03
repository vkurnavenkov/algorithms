# Leetcode 147. Insertion Sort List
#
# Sort a linked list using insertion sort.
#
# Algorithm of Insertion Sort:
#
# Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
# At each iteration, insertion sort removes one element from the input data,
# finds the location it belongs within the sorted list, and inserts it there.
# It repeats until no input elements remain.
#
# Example 1:
#
# Input: 4->2->1->3
# Output: 1->2->3->4
# Example 2:
#
# Input: -1->5->3->4->0
# Output: -1->0->3->4->5
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
def insertion_sort_list(head)
    return head if head == nil || head.next == nil
    cur = head
    while cur.next != nil
        node = cur.next
        if node.val < cur.val
            cur.next = node.next
            if node.val < head.val
                node.next = head
                head = node
            else
                p = head
                while node.val > p.next.val
                    p = p.next
                end
                node.next = p.next
                p.next = node
            end
        else
            cur = cur.next
        end
    end
    head
end
