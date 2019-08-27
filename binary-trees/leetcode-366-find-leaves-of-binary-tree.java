// LeetCode 366. Find Leaves of Binary Tree
//
// Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.
//
// Example:
//
// Input: [1,2,3,4,5]
//
//           1
//          / \
//         2   3
//        / \
//       4   5
//
// Output: [[4,5,3],[2],[1]]
//
// Explanation:
//
// 1. Removing the leaves [4,5,3] would result in this tree:
//
//           1
//          /
//         2
//
// 2. Now removing the leaf [2] would result in this tree:
//
//           1
//
// 3. Now removing the leaf [1] would result in the empty tree:
//
//           []
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
    public List<List<Integer>> findLeaves(TreeNode root) {
        List<List<Integer>> result = new LinkedList<>();
        while (root != null) {
            List<Integer> leaves = new ArrayList<>();
            root = findLeaves(root, leaves);
            result.add(leaves);
        }
        return result;
    }

    private TreeNode findLeaves(TreeNode root, List<Integer> leaves) {
        if (root == null) return null;

        if (root.left == null && root.right == null) {
            leaves.add(root.val);
            return null;
        }

        root.left = findLeaves(root.left, leaves);
        root.right = findLeaves(root.right, leaves);
        return root;
    }
}
