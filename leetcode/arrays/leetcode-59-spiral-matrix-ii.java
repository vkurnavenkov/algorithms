// LeetCode 59. Spiral Matrix II
//
// Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
//
// Example:
//
// Input: 3
// Output:
// [
//  [ 1, 2, 3 ],
//  [ 8, 9, 4 ],
//  [ 7, 6, 5 ]
// ]
//

class Solution {
    public int[][] generateMatrix(int n) {
        int[][] m = new int[n][n];

        int r = 0;
        int c = 0;
        int dir = 0;
        int[][] deltas = new int[][] { {0, 1}, {1, 0}, {0, -1}, {-1, 0} };

        for (int i = 0; i < n * n; i++) {
            m[r][c] = i + 1;

            int dr = deltas[dir][0];
            int dc = deltas[dir][1];
            if (r + dr >= 0 && r + dr < n && c + dc >= 0 && c + dc < n && m[r + dr][c + dc] == 0) {
                r += dr;
                c += dc;
            } else {
                dir = (dir + 1) % 4;
                r += deltas[dir][0];
                c += deltas[dir][1];
            }
        }

        return m;
    }
}
