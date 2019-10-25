// LeetCode 329. Longest Increasing Path in a Matrix
// https://leetcode.com/problems/longest-increasing-path-in-a-matrix/
//
// Given an integer matrix, find the length of the longest increasing path.
//
// From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).
//
// Example 1:
//
// Input: nums =
// [
//   [9,9,4],
//   [6,6,8],
//   [2,1,1]
// ]
// Output: 4
// Explanation: The longest increasing path is [1, 2, 6, 9].
// Example 2:
//
// Input: nums =
// [
//   [3,4,5],
//   [3,2,6],
//   [2,2,1]
// ]
// Output: 4
// Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
//

// Solution 1.
// Runtime complexity: O(nm)
// Space complexity: O(nm)
//

class Solution {
    private static final int[][] dirs = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};

    public int longestIncreasingPath(int[][] matrix) {
        if (matrix.length == 0) return 0;

        int m = matrix.length;
        int n = matrix[0].length;
        int maxLen = 0;
        int[][] cache = new int[m][n];
        for (int r = 0; r < m; r++) {
            for (int c = 0; c < n; c++) {
                maxLen = Math.max(maxLen, dfs(matrix, r, c, cache));
            }
        }
        return maxLen;
    }

    private int dfs(int[][] matrix, int r, int c, int[][] cache) {
        if (cache[r][c] != 0) return cache[r][c];

        int len = 0;
        for (int[] d: dirs) {
            int r2 = r + d[0];
            int c2 = c + d[1];
            if (inBound(matrix, r2, c2) && matrix[r2][c2] < matrix[r][c]) {
                len = Math.max(len, dfs(matrix, r2, c2, cache));
            }
        }
        cache[r][c] = len + 1;
        return cache[r][c];
    }

    private boolean inBound(int[][] matrix, int r, int c) {
        return r >= 0 && c >= 0 && r < matrix.length && c < matrix[0].length;
    }
}
