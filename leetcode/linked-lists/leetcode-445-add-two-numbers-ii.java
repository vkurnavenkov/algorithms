// LeetCode 445. Add Two Numbers II
// https://leetcode.com/problems/add-two-numbers-ii/
//
// You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
//
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//
// Follow up:
// What if you cannot modify the input lists? In other words, reversing the lists is not allowed.
//
// Example:
//
// Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 8 -> 0 -> 7
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
        if (l1 == null && l2 == null) return null;
        if (l1 == null || l2 == null) return l1 == null ? l2 : l1;

        int len1 = listLength(l1);
        int len2 = listLength(l2);
        if (len1 < len2) {
            l1 = alignList(l1, len2 - len1);
        } else if (len1 > len2) {
            l2 = alignList(l2, len1 - len2);
        }

        ListNode result = buildResult(l1, l2);
        return result.val == 0 ? result.next : result;
    }

    private ListNode buildResult(ListNode l1, ListNode l2) {
        if (l1 == null && l2 == null) return new ListNode(0);

        ListNode nextNode = buildResult(l1.next, l2.next);
        int sum = l1.val + l2.val + nextNode.val;
        nextNode.val = sum % 10;
        ListNode node = new ListNode(sum / 10);
        node.next = nextNode;

        return node;
    }

    private int listLength(ListNode head) {
        int length = 0;
        while (head != null) {
            length++;
            head = head.next;
        }
        return length;
    }

    private ListNode alignList(ListNode head, int lenDiff) {
        while (lenDiff > 0) {
            ListNode node = new ListNode(0);
            node.next = head;
            head = node;
            lenDiff--;
        }
        return head;
    }
}
