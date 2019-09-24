// LeetCode 272. Closest Binary Search Tree Value II
//
// Given a non-empty binary search tree and a target value, find k values in the BST that are closest to the target.
//
// Note:
//
// Given target value is a floating point.
// You may assume k is always valid, that is: k ≤ total nodes.
// You are guaranteed to have only one unique set of k values in the BST that are closest to the target.
// Example:
//
// Input: root = [4,2,5,1,3], target = 3.714286, and k = 2
//
//     4
//    / \
//   2   5
//  / \
// 1   3
//
// Output: [4,3]
// Follow up:
// Assume that the BST is balanced, could you solve it in less than O(n) runtime (where n = total nodes)?
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
    public List<Integer> closestKValues(TreeNode root, double target, int k) {
        List<Integer> list = new LinkedList<>();

        TreeNode rightNode = findNextClosestNode(root, target, null);
        TreeNode leftNode = findPrevClosestNode(root, target);

        while (list.size() < k) {
            double leftDist = leftNode != null ? Math.abs(leftNode.val - target) : Double.MAX_VALUE;
            double rightDist = rightNode != null ? Math.abs(rightNode.val - target) : Double.MAX_VALUE;

            if (leftDist < rightDist) {
                list.add(leftNode.val);
                leftNode = findPrevClosestNode(root, leftNode.val);
            } else {
                list.add(rightNode.val);
                rightNode = findNextClosestNode(root, rightNode.val, rightNode);
            }
        }

        return list;
    }

    private TreeNode findNextClosestNode(TreeNode root, double target, TreeNode skipNode) {
        TreeNode node = null;
        while (root != null) {
            if (root.val >= target && root != skipNode && (node == null || Math.abs(node.val - target) > Math.abs(root.val - target))) {
                node = root;
            }
            root = root.val <= target ? root.right : root.left;
        }

        return node;
    }

    private TreeNode findPrevClosestNode(TreeNode root, double target) {
        TreeNode node = null;
        while (root != null) {
            if (root.val < target && (node == null || Math.abs(node.val - target) > Math.abs(root.val - target))) {
                node = root;
            }
            root = root.val < target ? root.right : root.left;
        }

        return node;
    }
}
