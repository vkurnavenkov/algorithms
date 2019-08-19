// Leetcode 83. Remove Duplicates from Sorted List
//
// Given a sorted linked list, delete all duplicates such that each element appear only once.
//
// Example 1:
//
// Input: 1->1->2
// Output: 1->2
// Example 2:
//
// Input: 1->1->2->3->3
// Output: 1->2->3
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
    public ListNode deleteDuplicates(ListNode head) {
        if (head == null) return null;

        ListNode prev = head;
        ListNode cur = prev.next;
        while (cur != null) {
            if (cur.val == prev.val) {
                prev.next = cur.next;
            } else {
                prev = cur;
            }
            cur = cur.next;
        }
        return head;
    }
}
