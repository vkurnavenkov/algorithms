// LeetCode 750. Number Of Corner Rectangles
//
// Given a grid where each entry is only 0 or 1, find the number of corner rectangles.
//
// A corner rectangle is 4 distinct 1s on the grid that form an axis-aligned rectangle. Note that only the corners need to have the value 1. Also, all four 1s used must be distinct.
//
//
//
// Example 1:
//
// Input: grid =
// [[1, 0, 0, 1, 0],
//  [0, 0, 1, 0, 1],
//  [0, 0, 0, 1, 0],
//  [1, 0, 1, 0, 1]]
// Output: 1
// Explanation: There is only one corner rectangle, with corners grid[1][2], grid[1][4], grid[3][2], grid[3][4].
//
//
// Example 2:
//
// Input: grid =
// [[1, 1, 1],
//  [1, 1, 1],
//  [1, 1, 1]]
// Output: 9
// Explanation: There are four 2x2 rectangles, four 2x3 and 3x2 rectangles, and one 3x3 rectangle.
//
//
// Example 3:
//
// Input: grid =
// [[1, 1, 1, 1]]
// Output: 0
// Explanation: Rectangles must have four distinct corners.
//

// Solution 1.
// Runtime complexity: O(C*C*R)
// Space complexity: O(C*C)
// where, R - number of rows, C - number of columns
//
class Solution {
    public int countCornerRectangles(int[][] grid) {
        if (grid.length == 0) return 0;

        int numCols = grid[0].length;
        int[][] counts = new int[numCols][numCols];
        int result = 0;

        for (int[] row: grid) {
            for (int i = 0; i < row.length; i++) {
                if (row[i] == 1) {
                    for (int j = i + 1; j < row.length; j++) {
                        if (row[j] == 1) {
                            result += counts[i][j];
                            counts[i][j]++;
                        }
                    }
                }
            }
        }
        return result;
    }
}

// Solution 2.
// Runtime complexity: O(C*R*R)
// Space complexity: O(1)
// where, R - number of rows, C - number of columns
//
class Solution {
    public int countCornerRectangles(int[][] grid) {
        if (grid.length == 0) return 0;

        int numRows = grid.length;
        int numCols = grid[0].length;
        int result = 0;

        for (int i = 0; i < numRows; i++) {
            for (int j = i + 1; j < numRows; j++) {
                int matches = 0;
                for (int c = 0; c < numCols; c++) {
                    if (grid[i][c] == 1 && grid[j][c] == 1) matches++;
                }
                result += (matches - 1) * matches / 2;
            }
        }
        return result;
    }
}
