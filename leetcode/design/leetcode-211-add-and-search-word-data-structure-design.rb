# LeetCode 211. Add and Search Word - Data structure design
#
# Design a data structure that supports the following two operations:
#
# void addWord(word)
# bool search(word)
# search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.
#
# Example:
#
# addWord("bad")
# addWord("dad")
# addWord("mad")
# search("pad") -> false
# search("bad") -> true
# search(".ad") -> true
# search("b..") -> true
# Note:
# You may assume that all words are consist of lowercase letters a-z.
#

class WordDictionary

    class TrieNode
        attr_reader :children
        attr_accessor :word

        def initialize
            @children = {}
            @word = false
        end
    end

    attr_reader :root

    def initialize
        @root = TrieNode.new
    end


=begin
    Adds a word into the data structure.
    :type word: String
    :rtype: Void
=end
    def add_word(word)
        node = root
        word.chars.each do |c|
            node.children[c] = TrieNode.new unless node.children.key?(c)
            node = node.children[c]
        end
        node.word = true
    end


=begin
    Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        search_prefix(root, word, 0)
    end

    private

    def search_prefix(root, prefix, start)
        node = root
        (start...prefix.size).each do |i|
            c = prefix[i]
            if c == '.'
                node.children.values.each do |n|
                    return true if search_prefix(n, prefix, i + 1)
                end
                return false
            end
            return false unless node.children.key?(c)

            node = node.children[c]
        end

        node != nil && node.word
    end
end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
