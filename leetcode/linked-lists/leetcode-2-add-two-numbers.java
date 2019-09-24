// Leetcode 2. Add Two Numbers
//
// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Example:
//
// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.
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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode curL1 = l1;
        ListNode curL2 = l2;
        ListNode head = null;
        ListNode tail = null;
        int carry = 0;
        while (curL1 != null || curL2 != null) {
            int val = carry +
                (curL1 != null ? curL1.val : 0) + (curL2 != null ? curL2.val : 0);
            carry = val / 10;
            ListNode node = new ListNode(val % 10);
            if (head != null) tail.next = node;
            else head = node;
            tail = node;
            if (curL1 != null) curL1 = curL1.next;
            if (curL2 != null) curL2 = curL2.next;
        }
        if (carry == 1) tail.next = new ListNode(carry);

        return head;
    }
}
