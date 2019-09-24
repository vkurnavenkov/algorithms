// Leetcode 109. Convert Sorted List to Binary Search Tree
// https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
//
// Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
//
// For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
// Example:
//
// Given the sorted linked list: [-10,-3,0,5,9],
//
// One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
//
//       0
//      / \
//    -3   9
//    /   /
//  -10  5
//


// Solution 1.
// Runtime complexity: NlogN
// Space complexity: logN
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode sortedListToBST(ListNode head) {
        return buildTree(head, null);
    }

    private TreeNode buildTree(ListNode head, ListNode tail) {
        if (head == null || head == tail) return null;

        ListNode listNode = partitionList(head, tail);
        TreeNode treeNode = new TreeNode(listNode.val);
        treeNode.left = buildTree(head, listNode);
        treeNode.right = buildTree(listNode.next, tail);
        return treeNode;
    }

    private ListNode partitionList(ListNode head, ListNode tail) {
        ListNode slow = head;
        ListNode fast = head;
        while (fast != tail && fast.next != tail) {
            slow = slow.next;
            fast = fast.next.next;
        }
        return slow;
    }
}

// Solution 2.
// Runtime complexity: N
// Space complexity: logN
//
// Note: it does not pass tests as creates node in different order.

class Solution {
    ListNode head;
    public TreeNode sortedListToBST(ListNode head) {
        this.head = head;
        return buildTree(0, listSize(head) - 1);
    }

    private TreeNode buildTree(int left, int right) {
        System.out.println("L: " + left + ", R: " + right);
        if (left > right) return null;

        int mid = (left + right) / 2;
        System.out.println(mid);
        TreeNode leftNode = buildTree(left, mid - 1);
        TreeNode node = new TreeNode(head.val);
        System.out.println("ADDED: " + head.val);
        node.left = leftNode;
        head = head.next;
        node.right = buildTree(mid + 1, right);
        return node;
    }

    private int listSize(ListNode head) {
        int size = 0;
        while (head != null) {
            size ++;
            head = head.next;
        }
        return size;
    }
}
