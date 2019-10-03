# LeetCode 200. Number of Islands
# https://leetcode.com/problems/number-of-islands/
#
# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
#
# Example 1:
#
# Input:
# 11110
# 11010
# 11000
# 00000
#
# Output: 1
# Example 2:
#
# Input:
# 11000
# 11000
# 00100
# 00011
#
# Output: 3
#

class Solution
    def solve(grid)
        return 0 if grid.empty?

        n = grid.size
        m = grid[0].size
        islands = 0
        (0...n).each do |r|
            (0...m).each do |c|
                if grid[r][c] == '1'
                    dfs(grid, r, c)
                    islands += 1
                end
            end
        end
        islands
    end

    private

    def dfs(grid, r, c)
        return if !in_bound?(grid, r, c) || grid[r][c] == '0'

        grid[r][c] = '0'
        deltas = [[1, 0], [-1, 0], [0, 1], [0, -1]]
        deltas.each do |dr, dc|
            dfs(grid, r + dr, c + dc)
        end
    end

    def in_bound?(grid, r, c)
        r >= 0 && r < grid.size && c >= 0 && c < grid[0].size
    end
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    Solution.new.solve(grid)
end
