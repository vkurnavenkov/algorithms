// Leetcode 24. Swap Nodes in Pairs
//
// Given a linked list, swap every two adjacent nodes and return its head.
//
// You may not modify the values in the list's nodes, only nodes itself may be changed.
//
// Example:
//
// Given 1->2->3->4, you should return the list as 2->1->4->3.
//
//
// Definition for singly-linked list.
// class ListNode
//     attr_accessor :val, :next
//     def initialize(val)
//         @val = val
//         @next = nil
//     end
// end
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode swapPairs(ListNode head) {
        if (head == null || head.next == null) return head;

        ListNode newHead = new ListNode(1);
        ListNode tail = newHead;
        while (head != null && head.next != null) {
            tail.next = head.next;
            head.next = tail.next.next;
            tail.next.next = head;
            head = head.next;
            tail = tail.next.next;
        }

        return newHead.next;
    }
}
