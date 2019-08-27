// Leetcode 222. Count Complete Tree Nodes
//
// Given a complete binary tree, count the number of nodes.
//
// Note:
//
// Definition of a complete binary tree from Wikipedia:
// In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
//
// Example:
//
// Input:
//     1
//    / \
//   2   3
//  / \  /
// 4  5 6
//
// Output: 6
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

// Solution 1.
//
// Runtime complexity: O(n)
// Space complexity: O(log n) (recursion stack)

class Solution {
    public int countNodes(TreeNode root) {
        if (root == null) return 0;

        return countNodes(root.left) + countNodes(root.right) + 1;
    }
}

// Solution 2.
//
// Runtime complexity: O(d), where d - depth.
// Space complexity: O(1) (recursion stack)

class Solution {
    public int countNodes(TreeNode root) {
        if (root == null) return 0;

        int depth = treeDepth(root);
        if (depth == 0) return 1;

        int l = 0;
        int r = (int)Math.pow(2, depth) -1;
        while (l <= r) {
            int mid = (r + l) / 2;
            if (checkExistence(root, mid, depth)) l = mid + 1;
            else r = mid - 1;
        }

        return (int)Math.pow(2, depth) - 1 + l;
    }

    private int treeDepth(TreeNode root) {
        int depth = 0;
        TreeNode n = root;
        while (n.left != null) {
            depth++;
            n = n.left;
        }
        return depth;
    }

    private boolean checkExistence(TreeNode root, int idx, int depth) {
        int l = 0;
        int r = (int)Math.pow(2, depth) -1;
        TreeNode n = root;
        for (int i = 0; i < depth; i++) {
            int mid = (l + r) / 2;
            if (idx <= mid) {
                n = n.left;
                r = mid;
            } else {
                n = n.right;
                l = mid + 1;
            }
        }
        return n != null;
    }
}
