# Leetcode 463. Island Perimeter
#
# You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water.
# Grid cells are connected horizontally/vertically (not diagonally).
# The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).
# The island doesn't have "lakes" (water inside that isn't connected to the water around the island).
# One cell is a square with side length 1.
# The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
#
# Example:
#
# [[0,1,0,0],
#  [1,1,1,0],
#  [0,1,0,0],
#  [1,1,0,0]]
#
# Answer: 16

def empty_cell?(grid, r, c)
    r < 0 || c < 0 || r >= grid.size || c >= grid[0].size || grid[r][c] == 0
end

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
    return 0 if grid.empty?
    rows_size = grid.size
    cols_size = grid[0].size
    result = 0
    (0..rows_size - 1).each do |r|
        (0..cols_size - 1).each do |c|
            next if grid[r][c] == 0
            [[-1, 0], [0, -1], [1, 0], [0, 1]].each do |dr, dc|
                result += 1 if empty_cell?(grid, r + dr, c + dc)
            end
        end
    end
    result
end
