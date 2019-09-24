# Leetcode 2. Add Two Numbers
#
# You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
#
# Example:
#
# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
#

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    cur_l1 = l1
    cur_l2 = l2
    head = nil
    tail = nil
    add = 0
    while cur_l1 || cur_l2
        val = add
        val += cur_l1.val if cur_l1
        val += cur_l2.val if cur_l2
        add = val / 10
        node = ListNode.new(val % 10)
        if head == nil
            head = node
        else
            tail.next = node
        end
        tail = node
        cur_l1 = cur_l1.next if cur_l1
        cur_l2 = cur_l2.next if cur_l2
    end

    tail.next = ListNode.new(add) if add == 1

    head
end
