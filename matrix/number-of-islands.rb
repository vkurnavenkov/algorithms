# Leetcode 200. Number of Islands
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
#
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

def in_bound?(grid, r, c)
    r >= 0 && c >= 0 && r < grid.size && c < grid[0].size
end

def find_island(grid, r, c)
    return unless in_bound?(grid, r, c)
    return if grid[r][c] == '0'
    grid[r][c] = '0'

    [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |dr, dc|
        find_island(grid, r + dr, c + dc)
    end
end

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
    return 0 if grid.empty?
    rows_size = grid.size
    cols_size = grid[0].size
    result = 0
    (0..rows_size - 1).each do |r|
        (0..cols_size - 1).each do |c|
            next if grid[r][c] == '0'
            find_island(grid, r, c)
            result += 1
        end
    end
    result
end
