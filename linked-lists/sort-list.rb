# Leetcode 148. Sort List
#
# Sort a linked list in O(n log n) time using constant space complexity.
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

def merge(head1, head2)
    head = nil
    tail = nil
    while head1 && head2
        if head1.val < head2.val
            node = head1
            head1 = head1.next
        else
            node = head2
            head2 = head2.next
        end
        node.next = nil
        if head
            tail.next = node
            tail = tail.next
        else
            head = node
            tail = node
        end
    end
    tail.next = head1 || head2
    head
end

# @param {ListNode} head
# @return {ListNode}
def sort_list(head)
    return head if head == nil || head.next == nil
    # Split onto 2 parts
    slow = head
    fast = head
    prev = nil
    while fast && fast.next != nil
        prev = slow
        slow = slow.next
        fast = fast.next.next
    end
    prev.next = nil

    # Sorting halves
    l_list = sort_list(head)
    r_list = sort_list(slow)

    # Merging 2 lists
    merge(l_list, r_list)
end
