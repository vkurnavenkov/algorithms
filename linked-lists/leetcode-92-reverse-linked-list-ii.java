// Leetcode 92. Reverse Linked List II
//
// Reverse a linked list from position m to n. Do it in one-pass.
//
// Note: 1 ≤ m ≤ n ≤ length of list.
//
// Example:
//
// Input: 1->2->3->4->5->NULL, m = 2, n = 4
// Output: 1->4->3->2->5->NULL
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
    public ListNode reverseBetween(ListNode head, int m, int n) {
        if (head == null || head.next == null || m == n) return head;

        ListNode curr = head;
        ListNode prev = null;
        int idx = 1;
        while (curr != null && idx < m) {
            idx++;
            prev = curr;
            curr = curr.next;
        }

        if (curr == null) return head;

        ListNode tail = curr;
        ListNode node = null;
        while (curr != null && idx <= n) {
            ListNode tmp = curr.next;
            curr.next = node;
            node = curr;
            curr = tmp;
            idx++;
        }
        tail.next = curr;
        if (prev != null) prev.next = node; else head = node;

        return head;
    }
}
