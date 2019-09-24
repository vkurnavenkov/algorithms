// Leetcode 143. Reorder List
//
// Given a singly linked list L: L0→L1→…→Ln-1→Ln,
// reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
//
// You may not modify the values in the list's nodes, only nodes itself may be changed.
//
// Example 1:
//
// Given 1->2->3->4, reorder it to 1->4->2->3.
// Example 2:
//
// Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
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
    public void reorderList(ListNode head) {
        if (head == null || head.next == null) return;

        ListNode slow = head;
        ListNode fast = head;

        // Find the middle
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        ListNode tmp = slow.next;
        slow.next = null;
        slow = tmp;

        // Reverse
        ListNode prev = null;
        while (slow != null) {
            tmp = slow.next;
            slow.next = prev;
            prev = slow;
            slow = tmp;
        }

        // Merge
        ListNode p1 = head;
        ListNode p2 = prev;
        while (p2 != null) {
            tmp = p2.next;
            p2.next = p1.next;
            p1.next = p2;
            p1 = p2.next;
            p2 = tmp;
        }
    }
}
