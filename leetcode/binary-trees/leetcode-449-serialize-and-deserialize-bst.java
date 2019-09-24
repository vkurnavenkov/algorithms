// LeetCode 449. Serialize and Deserialize BST
//
// Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
//
// Design an algorithm to serialize and deserialize a binary search tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary search tree can be serialized to a string and this string can be deserialized to the original tree structure.
//
// The encoded string should be as compact as possible.
//
// Note: Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
//
//
// Definition for a binary tree node.
// class TreeNode
//     attr_accessor :val, :left, :right
//     def initialize(val)
//         @val = val
//         @left, @right = nil, nil
//     end
// end
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
public class Codec {

    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        if (root == null) return "";

        StringBuilder sb = postOrder(root, new StringBuilder());
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }

    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        if (data.isEmpty()) return null;

        LinkedList<Integer> list = new LinkedList();
        for (String s: data.split(","))
            list.add(Integer.parseInt(s));
        return doDeserialize(list, Integer.MIN_VALUE, Integer.MAX_VALUE);
    }

    private StringBuilder postOrder(TreeNode root, StringBuilder sb) {
        if (root == null) return sb;

        postOrder(root.left, sb);
        postOrder(root.right, sb);
        sb.append(root.val + ",");
        return sb;
    }

    private TreeNode doDeserialize(LinkedList<Integer> list, int left, int right) {
        if (list.isEmpty()) return null;

        int val = list.getLast();
        if (val < left || val > right) return null;

        list.removeLast();
        TreeNode node = new TreeNode(val);
        node.right = doDeserialize(list, val, right);
        node.left = doDeserialize(list, left, val);
        return node;
    }
}

// Your Codec object will be instantiated and called as such:
// Codec codec = new Codec();
// codec.deserialize(codec.serialize(root));
