// Leetcode 695. Max Area of Island
// https://leetcode.com/problems/max-area-of-island/
//
// Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
//
// Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
//
// Example 1:
//
// [[0,0,1,0,0,0,0,1,0,0,0,0,0],
//  [0,0,0,0,0,0,0,1,1,1,0,0,0],
//  [0,1,1,0,1,0,0,0,0,0,0,0,0],
//  [0,1,0,0,1,1,0,0,1,0,1,0,0],
//  [0,1,0,0,1,1,0,0,1,1,1,0,0],
//  [0,0,0,0,0,0,0,0,0,0,1,0,0],
//  [0,0,0,0,0,0,0,1,1,1,0,0,0],
//  [0,0,0,0,0,0,0,1,1,0,0,0,0]]
// Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
// Example 2:
//
// [[0,0,0,0,0,0,0,0]]
// Given the above grid, return 0.
//

// Solution 1. BFS
//

class Solution {
    public int maxAreaOfIsland(int[][] grid) {
        if (grid.length == 0) return 0;

        int maxSquare = 0;
        int n = grid.length;
        int m = grid[0].length;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < m; c++) {
                if (grid[r][c] == 1) {
                    grid[r][c] = 0;
                    int square = 1;
                    Queue<Integer> queue = new LinkedList();
                    queue.offer(cellNumber(r, c, m));
                    while (!queue.isEmpty()) {
                        int val = queue.poll();
                        int row = val / m;
                        int col = val % m;
                        if (row > 0 && grid[row - 1][col] == 1) {
                            queue.offer(cellNumber(row - 1, col, m));
                            grid[row - 1][col] = 0;
                            square += 1;
                        }
                        if (col > 0 && grid[row][col - 1] == 1) {
                            queue.offer(cellNumber(row, col - 1, m));
                            grid[row][col - 1] = 0;
                            square += 1;
                        }
                        if (row < n - 1 && grid[row + 1][col] == 1) {
                            queue.offer(cellNumber(row + 1, col, m));
                            grid[row + 1][col] = 0;
                            square += 1;
                        }
                        if (col < m - 1 && grid[row][col + 1] == 1) {
                            queue.offer(cellNumber(row, col + 1, m));
                            grid[row][col + 1] = 0;
                            square += 1;
                        }
                    }
                    if (square > maxSquare) maxSquare = square;
                }
            }
        }
        return maxSquare;
    }

    private int cellNumber(int row, int col, int numCols) {
        return row * numCols + col;
    }
}

// Solution 2. DFS
//

class Solution {
    public int maxAreaOfIsland(int[][] grid) {
        if (grid.length == 0) return 0;

        int maxSquare = 0;
        int n = grid.length;
        int m = grid[0].length;
        for (int r = 0; r < n; r++) {
            for (int c = 0; c < m; c++) {
                if (grid[r][c] == 1) {
                    int square = islandArea(grid, r, c);
                    if (square > maxSquare) maxSquare = square;
                }
            }
        }
        return maxSquare;
    }

    private int islandArea(int[][] grid, int row, int col) {
        if (!inBound(grid, row, col) || grid[row][col] == 0) return 0;

        grid[row][col] = 0;
        return 1 + islandArea(grid, row - 1, col) + islandArea(grid, row + 1, col) +
            islandArea(grid, row, col - 1) + islandArea(grid, row, col + 1);
    }

    private boolean inBound(int[][] grid, int row, int col) {
        return row >= 0 && row < grid.length && col >= 0 && col < grid[0].length;
    }
}
