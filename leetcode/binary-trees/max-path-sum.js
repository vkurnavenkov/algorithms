// Leetcode 124. Binary Tree Maximum Path Sum
// Given a non-empty binary tree, find the maximum path sum.
//

/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

/**
 * @param {TreeNode} root
 * @return {number}
 */

const maxPathSum = (root) => {
    const maxSumHelper = (root) => {
        if (!root) return 0;

        const leftSum = maxSumHelper(root.left);
        const rightSum = maxSumHelper(root.right);
        const result = Math.max(leftSum, rightSum, 0) + root.val;
        maxSum = Math.max(maxSum, result, leftSum + rightSum + root.val);
        return result;
    };

    let maxSum = -Infinity
    maxSumHelper(root);
    return maxSum;
};
