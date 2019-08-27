// LeetCode 124. Binary Tree Maximum Path Sum
//
// Given a non-empty binary tree, find the maximum path sum.
//
// For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
//
// Example 1:
//
// Input: [1,2,3]
//
//        1
//       / \
//      2   3
//
// Output: 6
// Example 2:
//
// Input: [-10,9,20,null,null,15,7]
//
//    -10
//    / \
//   9  20
//     /  \
//    15   7
//
// Output: 42
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
    private int maxSum;

    public int maxPathSum(TreeNode root) {
        if (root == null) return 0;

        maxSum = root.val;
        calculateSum(root);

        return maxSum;
    }

    private int calculateSum(TreeNode root) {
        if (root == null) return 0;

        int leftSum = calculateSum(root.left);
        int rightSum = calculateSum(root.right);
        int curMaxSum = Math.max(
            root.val,
            Math.max(leftSum + root.val, rightSum + root.val)
        );
        maxSum = Math.max(
            maxSum,
            Math.max(leftSum + rightSum + root.val, curMaxSum)
        );

        return curMaxSum;
    }
}
