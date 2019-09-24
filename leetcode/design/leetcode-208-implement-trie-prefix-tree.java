// LeetCode 208. Implement Trie (Prefix Tree)
//
// Implement a trie with insert, search, and startsWith methods.
//
// Example:
//
// Trie trie = new Trie();
//
// trie.insert("apple");
// trie.search("apple");   // returns true
// trie.search("app");     // returns false
// trie.startsWith("app"); // returns true
// trie.insert("app");
// trie.search("app");     // returns true
// Note:
//
// You may assume that all inputs are consist of lowercase letters a-z.
// All inputs are guaranteed to be non-empty strings.
//

class Trie {
    class Node {
        Map<Character, Node> children;
        boolean isWord;

        public Node() {
            children = new HashMap();
            isWord = false;
        }
    }

    Node root;

    /** Initialize your data structure here. */
    public Trie() {
        root = new Node();
    }

    /** Inserts a word into the trie. */
    public void insert(String word) {
        Node node = root;
        for (int i = 0; i < word.length(); i++) {
            if (!node.children.containsKey(word.charAt(i))) {
                Node newNode = new Node();
                node.children.put(word.charAt(i), newNode);
            }
            node = node.children.get(word.charAt(i));
        }
        node.isWord = true;
    }

    /** Returns if the word is in the trie. */
    public boolean search(String word) {
        Node node = findLastNode(word);
        return node != null && node.isWord;
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    public boolean startsWith(String prefix) {
        return findLastNode(prefix) != null;
    }

    private Node findLastNode(String prefix) {
        Node node = root;
        for (int i = 0; i < prefix.length(); i++) {
            if (!node.children.containsKey(prefix.charAt(i))) return null;

            node = node.children.get(prefix.charAt(i));
        }

        return node;
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = new Trie();
 * obj.insert(word);
 * boolean param_2 = obj.search(word);
 * boolean param_3 = obj.startsWith(prefix);
 */
