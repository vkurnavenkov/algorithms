// LeetCode 173. Binary Search Tree Iterator
//
// Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
//
// Calling next() will return the next smallest number in the BST.
//
// Example:
//
// BSTIterator iterator = new BSTIterator(root);
// iterator.next();    // return 3
// iterator.next();    // return 7
// iterator.hasNext(); // return true
// iterator.next();    // return 9
// iterator.hasNext(); // return true
// iterator.next();    // return 15
// iterator.hasNext(); // return true
// iterator.next();    // return 20
// iterator.hasNext(); // return false
//
// Note:
//
// next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
// You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
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
// Space: O(h)
// Runtime: O(logN) (next, hasNext)
//

class BSTIterator {
    private TreeNode root;
    Integer curValue;

    public BSTIterator(TreeNode root) {
        this.root = root;
        this.curValue = null;
    }

    /** @return the next smallest number */
    public int next() {
        curValue = findNextValue(root, curValue);
        return curValue;
    }

    /** @return whether we have a next smallest number */
    public boolean hasNext() {
        return findNextValue(root, curValue) != null;
    }

    private Integer findNextValue(TreeNode root, Integer minValue) {
        Integer value = null;
        while (root != null) {
            if (minValue == null || root.val > minValue) {
                if (value == null || root.val < value) value = root.val;
                root = root.left;
            } else {
                root = root.right;
            }
        }
        return value;
    }
}

// Solution 2.
// Space: O(h)
// Runtime: O(1) amortized (in average)
//

class BSTIterator {
    private TreeNode root;
    private TreeNode curNode;
    private Stack<TreeNode> stack;

    public BSTIterator(TreeNode root) {
        this.root = root;
        curNode = null;
        stack = new Stack();
        fillStack(stack, root);
    }

    /** @return the next smallest number */
    public int next() {
        curNode = stack.pop();
        fillStack(stack, curNode.right);
        return curNode.val;
    }

    /** @return whether we have a next smallest number */
    public boolean hasNext() {
        return !stack.isEmpty();
    }

    private void fillStack(Stack<TreeNode> stack, TreeNode root) {
        while (root != null) {
            stack.push(root);
            root = root.left;
        }
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator obj = new BSTIterator(root);
 * int param_1 = obj.next();
 * boolean param_2 = obj.hasNext();
 */
