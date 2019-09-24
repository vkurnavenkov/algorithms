// LeetCode 426. Convert Binary Search Tree to Sorted Doubly Linked List
//
// Convert a BST to a sorted circular doubly-linked list in-place.
// Think of the left and right pointers as synonymous to the previous and next pointers in a doubly-linked list.
//
// We want to transform this BST into a circular doubly linked list.
// Each node in a doubly linked list has a predecessor and successor.
// For a circular doubly linked list, the predecessor of the first element is the last element,
// and the successor of the last element is the first element.
//
// Specifically, we want to do the transformation in place.
// After the transformation, the left pointer of the tree node should point to its predecessor,
// and the right pointer should point to its successor.
// We should return the pointer to the first element of the linked list.
//

// Solution 1. Recursive.
//

/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;

    public Node() {}

    public Node(int _val,Node _left,Node _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};
*/
class Solution {
    public Node treeToDoublyList(Node root) {
        if (root == null) return null;

        Node left = treeToDoublyList(root.left);
        Node right = treeToDoublyList(root.right);

        if (left == null && right == null) {
            root.left = root;
            root.right = root;
            return root;
        }

        if (left == null) {
            root.right = right;
            root.left = right.left;
            right.left.right = root;
            right.left = root;
            return root;
        }

        if (right == null) {
            root.right = left;
            root.left = left.left;
            left.left.right = root;
            left.left = root;
            return left;
        }

        root.right = right;
        root.left = left.left;
        left.left.right = root;
        left.left = right.left;
        right.left.right = left;
        right.left = root;

        return left;
    }
}

// Solution 2. Iterative.
//

/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;

    public Node() {}

    public Node(int _val,Node _left,Node _right) {
        val = _val;
        left = _left;
        right = _right;
    }
};
*/
class Solution {
    public Node treeToDoublyList(Node root) {
        if (root == null) return null;

        Node cur = root;
        Node prev = null;
        Stack<Node> stack = new Stack();

        while (cur != null || !stack.isEmpty()) {
            while (cur != null) {
                stack.push(cur);
                cur = cur.left;
            }
            cur = stack.pop();
            if (prev == null) {
                root = cur;
            } else {
                prev.right = cur;
                cur.left = prev;
            }
            prev = cur;
            cur = cur.right;
        }
        root.left = prev;
        prev.right = root;

        return root;
    }
}
