# LeetCode 208. Implement Trie (Prefix Tree)
#
# Implement a trie with insert, search, and startsWith methods.
#
# Example:
#
# Trie trie = new Trie();
#
# trie.insert("apple");
# trie.search("apple");   // returns true
# trie.search("app");     // returns false
# trie.startsWith("app"); // returns true
# trie.insert("app");
# trie.search("app");     // returns true
# Note:
#
# You may assume that all inputs are consist of lowercase letters a-z.
# All inputs are guaranteed to be non-empty strings.
#

class Trie

=begin
    Initialize your data structure here.
=end
    class TrieNode
        attr_reader :children
        attr_accessor :word

        def initialize
            @children = {}
            @word = false
        end
    end

    attr_reader :root

    def initialize()
        @root = TrieNode.new
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        node = root
        word.chars.each do |c|
            node.children[c] = TrieNode.new unless node.children.key?(c)
            node = node.children[c]
        end
        node.word = true
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        node = find_last_node(word)
        node != nil && node.word
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        find_last_node(prefix) != nil
    end

    private

    def find_last_node(prefix)
        node = root
        prefix.chars.each do |c|
            return nil unless node.children.key?(c)

            node = node.children[c]
        end

        node
    end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
