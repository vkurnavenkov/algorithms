// Leetcode 148. Sort List
//
// Sort a linked list in O(n log n) time using constant space complexity.
//
// Example 1:
//
// Input: 4->2->1->3
// Output: 1->2->3->4
// Example 2:
//
// Input: -1->5->3->4->0
// Output: -1->0->3->4->5
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
    public ListNode sortList(ListNode head) {
        if (head == null || head.next == null) return head;

        ListNode mid = splitList(head);
        ListNode headRight = mid.next;

        mid.next = null;

        ListNode left = sortList(head);
        ListNode right = sortList(headRight);

        return mergeLists(left, right);
    }

    private ListNode splitList(ListNode head) {
        if (head == null) return null;

        ListNode slow = head;
        ListNode fast = head.next;
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }

        return slow;
    }

    private ListNode mergeLists(ListNode left, ListNode right) {
        if (left == null) return right;
        if (right == null) return left;

        if (left.val < right.val) {
            left.next = mergeLists(left.next, right);
            return left;
        }

        right.next = mergeLists(left, right.next);
        return right;
    }
}
