// Leetcode 200. Number of Islands
// https://leetcode.com/problems/number-of-islands/
//
// Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
// Example 1:
//
// Input:
// 11110
// 11010
// 11000
// 00000
//
// Output: 1
// Example 2:
//
// Input:
// 11000
// 11000
// 00100
// 00011
//
// Output: 3
//

class Solution {
    public int numIslands(char[][] grid) {
        if (grid.length == 0) return 0;

        int result = 0;
        for (int r = 0; r < grid.length; r++) {
            for (int c = 0; c < grid[0].length; c++) {
                if (grid[r][c] == '1') {
                    result++;
                    dfs(grid, r, c);
                }
            }
        }
        return result;
    }

    private void dfs(char[][] grid, int row, int col) {
        if (!inBound(grid, row, col) || grid[row][col] == '0') return;

        grid[row][col] = '0';
        dfs(grid, row + 1, col);
        dfs(grid, row - 1, col);
        dfs(grid, row, col + 1);
        dfs(grid, row, col - 1);
    }

    private boolean inBound(char[][] grid, int row, int col) {
        return row >= 0 && row < grid.length && col >= 0 && col < grid[0].length;
    }
}
