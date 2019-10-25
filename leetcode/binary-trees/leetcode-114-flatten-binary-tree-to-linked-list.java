// LeetCode 114. Flatten Binary Tree to Linked List
// https://leetcode.com/problems/flatten-binary-tree-to-linked-list/
//
// Given a binary tree, flatten it to a linked list in-place.
//
// For example, given the following tree:
//
//     1
//    / \
//   2   5
//  / \   \
// 3   4   6
// The flattened tree should look like:
//
// 1
//  \
//   2
//    \
//     3
//      \
//       4
//        \
//         5
//          \
//           6
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
    public void flatten(TreeNode root) {
        if (root == null) return;

        if (root.right != null) {
            flatten(root.right);
        }

        if (root.left != null) {
            flatten(root.left);

            TreeNode l = root.left;
            while (l.right != null) {
                l = l.right;
            }

            l.right = root.right;
            root.right = root.left;
            root.left = null;
        }
    }
}
