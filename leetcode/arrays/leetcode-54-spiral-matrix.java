// LeetCode 54. Spiral Matrix
//
// Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
// Example 1:
//
// Input:
// [
//  [ 1, 2, 3 ],
//  [ 4, 5, 6 ],
//  [ 7, 8, 9 ]
// ]
// Output: [1,2,3,6,9,8,7,4,5]
// Example 2:
//
// Input:
// [
//   [1, 2, 3, 4],
//   [5, 6, 7, 8],
//   [9,10,11,12]
// ]
// Output: [1,2,3,4,8,12,11,10,9,5,6,7]
//

class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> list = new ArrayList();
        if (matrix.length == 0) return list;

        int rowTop = 0;
        int colLeft = 0;
        int row = 0;
        int col = -1;
        int direction = 0;
        int height = matrix.length;
        int width = matrix[0].length;
        int[][] deltas = new int[][] { {0, 1}, {1, 0}, {0, -1}, {-1, 0} };

        while (height > 0 && width > 0) {
            int dRow = deltas[direction][0];
            int dCol = deltas[direction][1];
            row += dRow;
            col += dCol;
            while (row >= rowTop && row < rowTop + height && col >= colLeft && col < colLeft + width) {
                list.add(matrix[row][col]);
                row += dRow;
                col += dCol;
            }
            row -= dRow;
            col -= dCol;
            height -= Math.abs(dCol);
            width -= Math.abs(dRow);
            if (direction == 0) rowTop++;
            else if (direction == 3) colLeft++;
            direction = (direction + 1) % 4;
        }

        return list;
    }
}
