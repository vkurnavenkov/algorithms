# Leetcode 234. Palindrome Linked List
#
# Given a singly linked list, determine if it is a palindrome.
#
# Example 1:
#
# Input: 1->2
# Output: false
# Example 2:
#
# Input: 1->2->2->1
# Output: true
# Follow up:
# Could you do it in O(n) time and O(1) space?
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
# @return {Boolean}
def is_palindrome(head)
    slow = head
    fast = head

    # Find the middle
    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    # Reverse
    prev = nil
    while slow
        tmp = slow.next
        slow.next = prev
        prev = slow
        slow = tmp
    end

    # Match
    p1 = head
    p2 = prev
    while p2
        return false if p1.val != p2.val
        p1 = p1.next
        p2 = p2.next
    end

    true
end
