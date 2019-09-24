// Leetcode 270. Closest Binary Search Tree Value
//
// Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
//
// Note:
//
// Given target value is a floating point.
// You are guaranteed to have only one unique value in the BST that is closest to the target.
// Example:
//
// Input: root = [4,2,5,1,3], target = 3.714286
//
//     4
//    / \
//   2   5
//  / \
// 1   3
//
// Output: 4
//

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
    public int closestValue(TreeNode root, double target) {
        int result = root.val;
        TreeNode node = root;

        while (node != null) {
            if (Math.abs(node.val - target) < Math.abs(result - target)) result = node.val;
            node = target < node.val ? node.left : node.right;
        }

        return result;
    }
}
