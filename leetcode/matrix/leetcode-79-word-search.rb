# LeetCode 79. Word Search
# https://leetcode.com/problems/word-search/
#
# Given a 2D board and a word, find if the word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
#
# Example:
#
# board =
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
#
# Given word = "ABCCED", return true.
# Given word = "SEE", return true.
# Given word = "ABCB", return false.
#

class Solution
    DIRECTION = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    REPLACEMENT = ' '

    attr_reader :board, :word

    def initialize(board, word)
        @board = board
        @word = word
    end

    def solve
        if board.empty?
            return word.empty?
        end

        m = board.size
        n = board[0].size
        m.times do |r|
            n.times do |c|
                if board[r][c] == word[0]
                    return true if backtrack(r, c, 0)
                end
            end
        end
        false
    end

    private

    def backtrack(r, c, idx)
        return true if idx == word.size - 1
        # puts "IDX: #{idx}"

        result = false
        char = board[r][c]
        board[r][c] = REPLACEMENT
        DIRECTION.each do |dr, dc|
            r2 = r + dr
            c2 = c + dc
            if in_bound?(r2, c2) && board[r2][c2] == word[idx + 1]
                if backtrack(r2, c2, idx + 1)
                    result = true
                    break
                end
            end
        end
        board[r][c] = char
        result
    end

    def in_bound?(r, c)
        r >= 0 && r < board.size && c >= 0 && c < board[0].size
    end
end
# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
    Solution.new(board, word).solve
end
