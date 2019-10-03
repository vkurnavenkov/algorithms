# LeetCode 127. Word Ladder
# https://leetcode.com/problems/word-ladder/
#
# Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
#
# Only one letter can be changed at a time.
# Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
# Note:
#
# Return 0 if there is no such transformation sequence.
# All words have the same length.
# All words contain only lowercase alphabetic characters.
# You may assume no duplicates in the word list.
# You may assume beginWord and endWord are non-empty and are not the same.
# Example 1:
#
# Input:
# beginWord = "hit",
# endWord = "cog",
# wordList = ["hot","dot","dog","lot","log","cog"]
#
# Output: 5
#
# Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
# return its length 5.
# Example 2:
#
# Input:
# beginWord = "hit"
# endWord = "cog"
# wordList = ["hot","dot","dog","lot","log"]
#
# Output: 0
#
# Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
#

# Solution 1
# Graph + BFS

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
    # Build possible transformations map
    map = {}
    word_list.each do |word|
        (0...word.size).each do |i|
            new_word = "#{word[0...i]}*#{word[i + 1..-1]}"
            map[new_word] = [] unless map.key?(new_word)
            map[new_word].push(word)
        end
    end

    # BFS to find the shortest path
    visited = Set.new
    queue = [begin_word]
    level = 1
    while !queue.empty?
        queue.size.times do
            word = queue.shift
            (0...word.size).each do |i|
                new_word = "#{word[0...i]}*#{word[i + 1..-1]}"
                (map[new_word] || []).each do |w|
                    return level + 1 if w == end_word

                    if !visited.include?(w)
                        visited.add(w)
                        queue.push(w)
                    end
                end
            end
        end
        level += 1
    end

    0
end

# Solution 2
# Graph + bidirectional BFS

# @param {String} begin_word
# @param {String} end_word
# @param {String[]} word_list
# @return {Integer}
def ladder_length(begin_word, end_word, word_list)
    return 0 unless word_list.include?(end_word)

    # Build possible transformations map
    map = {}
    word_list.each do |word|
        (0...word.size).each do |i|
            new_word = "#{word[0...i]}*#{word[i + 1..-1]}"
            map[new_word] = [] unless map.key?(new_word)
            map[new_word].push(word)
        end
    end

    # BFS to find the shortest path
    visited_begin = { begin_word => 1 }
    visited_end = { end_word => 1 }
    queue_begin = [[begin_word, 1]]
    queue_end = [[end_word, 1]]
    while !queue_begin.empty? && !queue_end.empty?
        rv = process_level(queue_begin, map, visited_begin, visited_end)
        return rv if rv > 0
        rv = process_level(queue_end, map, visited_end, visited_begin)
        return rv if rv > 0
    end

    0
end

def process_level(queue, map, visited, visited_other)
    size = queue.size
    size.times do
        word, level = queue.shift
        (0...word.size).each do |i|
            new_word = "#{word[0...i]}*#{word[i + 1..-1]}"
            (map[new_word] || []).each do |w|
                if visited_other.include?(w)
                    return level + visited_other[w]
                end

                if !visited.key?(w)
                    visited[w] = level + 1
                    queue.push([w, level + 1])
                end
            end
        end
    end

    0
end
