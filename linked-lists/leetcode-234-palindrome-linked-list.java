// Leetcode 234. Palindrome Linked List
//
// Given a singly linked list, determine if it is a palindrome.
//
// Example 1:
//
// Input: 1->2
// Output: false
// Example 2:
//
// Input: 1->2->2->1
// Output: true
// Follow up:
// Could you do it in O(n) time and O(1) space?
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
    public boolean isPalindrome(ListNode head) {
        if( head==null || head.next==null ) return true;

        // Find middle
        ListNode fast = head;
        ListNode slow = head;
        while( fast != null && fast.next != null ){
            slow = slow.next;
            fast = fast.next.next;
        }

        // Reverse
        ListNode prev = null;
        while ( slow != null ) {
            ListNode tmp = slow.next;
            slow.next = prev;
            prev = slow;
            slow = tmp;
        }

        // Match
        ListNode p1 = head;
        ListNode p2 = prev;
        while( p2 != null ) {
            if ( p1.val != p2.val ) return false;
            p1 = p1.next;
            p2 = p2.next;
        }

        return true;
    }
}
