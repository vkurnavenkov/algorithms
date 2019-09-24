// LeetCode 199. Binary Tree Right Side View
//
// Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
// Example:
//
// Input: [1,2,3,null,5,null,4]
// Output: [1, 3, 4]
// Explanation:
//
//    1            <---
//  /   \
// 2     3         <---
//  \     \
//   5     4       <---
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
    public List<Integer> rightSideView(TreeNode root) {
        return dfs(root, 0, new LinkedList());
    }

    private List<Integer> dfs(TreeNode root, int level, List<Integer> list) {
        if (root == null) return list;

        if (list.size() == level) list.add(root.val);

        list = dfs(root.right, level + 1, list);
        list = dfs(root.left, level + 1, list);

        return list;
    }
}
