// Leetcode 160. Intersection of Two Linked Lists
//
// Write a program to find the node at which the intersection of two singly linked lists begins.
//
// Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
// Output: Reference of the node with value = 8
// Input Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect). From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,0,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        if (headA == null || headB == null) return null;

        int lenA = getLength(headA);
        int lenB = getLength(headB);

        ListNode p1, p2;
        int k = Math.abs(lenA - lenB);
        if (lenA > lenB) {
            p1 = headA;
            p2 = headB;
        } else {
            p1 = headB;
            p2 = headA;
        }

        for (int i = 1; i <= k; i++) p1 = p1.next;
        while (p1 != null) {
            if (p1 == p2) return p1;
            p1 = p1.next;
            p2 = p2.next;
        }

        return null;
    }

    private int getLength(ListNode head) {
        ListNode cur = head;
        int len = 0;
        while (cur != null) {
            len++;
            cur = cur.next;
        }

        return len;
    }
}
