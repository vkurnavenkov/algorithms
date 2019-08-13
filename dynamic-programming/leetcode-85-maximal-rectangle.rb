# Leetcode 85. Maximal Rectangle
#
# Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
#
# Example:
#
# Input:
# [
#   ["1","0","1","0","0"],
#   ["1","0","1","1","1"],
#   ["1","1","1","1","1"],
#   ["1","0","0","1","0"]
# ]
# Output: 6
#

# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
    return 0 if matrix.empty?

    n = matrix.size
    m = matrix[0].size
    heights = Array.new(m, 0)
    lefts = Array.new(m, 0)
    rights = Array.new(m, m)
    max_area = 0
    (0...n).each do |i|
        cur_left = 0
        cur_right = m - 1
        # Heights
        (0...m).each do |j|
            if matrix[i][j] == '1'
                heights[j] += 1
            else
                heights[j] = 0
            end
        end
        # Lefts
        (0...m).each do |j|
            if matrix[i][j] == '1'
                lefts[j] = [lefts[j], cur_left].max
            else
                lefts[j] = 0
                cur_left = j + 1
            end
        end
        # Rights
        (m - 1).downto(0).each do |j|
            if matrix[i][j] == '1'
                rights[j] = [rights[j], cur_right].min
            else
                rights[j] = m - 1
                cur_right = j - 1
            end
        end
        # Area
        (0...m).each do |j|
            max_area = [max_area, (rights[j] - lefts[j] + 1) * heights[j]].max
        end
    end

    max_area
end
