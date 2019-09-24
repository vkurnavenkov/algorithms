// LeetCode 428. Serialize and Deserialize N-ary Tree
//
// Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
//
// Design an algorithm to serialize and deserialize an N-ary tree. An N-ary tree is a rooted tree in which each node has no more than N children. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that an N-ary tree can be serialized to a string and this string can be deserialized to the original tree structure.
//
// For example, you may serialize the following 3-ary tree
//
// as [1 [3[5 6] 2 4]]. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
//
// Note:
//
// N is in the range of [1, 1000]
// Do not use class member/global/static variables to store states. Your serialize and deserialize algorithms should be stateless.
//

/*
// Definition for a Node.
class Node {
    public int val;
    public List<Node> children;

    public Node() {}

    public Node(int _val,List<Node> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Codec {

    // Encodes a tree to a single string.
    public String serialize(Node root) {
        if (root == null) return "";

        StringBuilder sb = doSerialize(root, new StringBuilder());
        sb.deleteCharAt(sb.length() - 1);
        return sb.toString();
    }

    // Decodes your encoded data to tree.
    public Node deserialize(String data) {
        if (data.isEmpty()) return null;

        Queue<String> list = new LinkedList(Arrays.asList(data.split(",")));
        return doDeserialize(list);
    }

    private StringBuilder doSerialize(Node root, StringBuilder sb) {
        if (root == null) return sb;

        sb.append(root.val);
        sb.append(',');

        for(Node n: root.children) {
            sb = doSerialize(n, sb);
        }
        sb.append("#,");

        return sb;
    }

    private Node doDeserialize(Queue<String> list) {
        if (list.isEmpty()) return null;

        String strVal = list.poll();
        int val = Integer.parseInt(strVal);
        List<Node> children = new LinkedList();
        while (list.peek().compareTo("#") != 0) {
            children.add(doDeserialize(list));
        }
        list.poll();

        return new Node(val, children);
    }
}

// Your Codec object will be instantiated and called as such:
// Codec codec = new Codec();
// codec.deserialize(codec.serialize(root));
