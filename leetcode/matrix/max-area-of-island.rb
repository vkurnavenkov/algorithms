# Leetcode 695. Max Area of Island
#
# Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
#
# Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
#
# Example 1:
# [[0,0,1,0,0,0,0,1,0,0,0,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,1,1,0,1,0,0,0,0,0,0,0,0],
#  [0,1,0,0,1,1,0,0,1,0,1,0,0],
#  [0,1,0,0,1,1,0,0,1,1,1,0,0],
#  [0,0,0,0,0,0,0,0,0,0,1,0,0],
#  [0,0,0,0,0,0,0,1,1,1,0,0,0],
#  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
# Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
# Example 2:
# [[0,0,0,0,0,0,0,0]]
# Given the above grid, return 0.
# Note: The length of each dimension in the given grid does not exceed 50.
#

def in_bound?(grid, r, c)
    r >= 0 && c >= 0 && r < grid.size && c < grid[0].size
end

def area(grid, r, c)
    return 0 unless in_bound?(grid, r, c)
    return 0 if grid[r][c] == 0
    grid[r][c] = 0
    result = 1
    [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |dr, dc|
        result += area(grid, r + dr, c + dc)
    end
    result
end


# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
    return 0 if grid.empty?
    rows_size = grid.size
    cols_size = grid[0].size
    result = 0
    (0..rows_size - 1).each do |r|
        (0..cols_size - 1).each do |c|
            next if grid[r][c] == 0
            val = area(grid, r, c)
            result = val if val > result
        end
    end
    result
end
