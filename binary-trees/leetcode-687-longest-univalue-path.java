// Leetcode 687. Longest Univalue Path
//
// Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.
//
// The length of path between two nodes is represented by the number of edges between them.
//
//
// Example 1:
//
// Input:
//
//               5
//              / \
//             4   5
//            / \   \
//           1   1   5
// Output: 2
//
//
// Example 2:
//
// Input:
//
//               1
//              / \
//             4   5
//            / \   \
//           4   4   5
// Output: 2
//
// Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.
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
    private int maxLength;
    public int longestUnivaluePath(TreeNode root) {
        maxLength = 0;
        dfs(root);
        return maxLength;
    }

    private int dfs(TreeNode root) {
        if (root == null) return 0;

        int leftLen = dfs(root.left);
        int rightLen = dfs(root.right);

        if (root.left != null && root.val == root.left.val) leftLen++;
        else leftLen = 0;
        if (root.right != null && root.val == root.right.val) rightLen++;
        else rightLen = 0;

        maxLength = Math.max(maxLength, leftLen + rightLen);
        return Math.max(leftLen, rightLen);
    }
}
