// LeetCode 498. Diagonal Traverse
// https://leetcode.com/problems/diagonal-traverse/
//
// Given a matrix of M x N elements (M rows, N columns), return all elements of the matrix in diagonal order as shown in the below image.
//
// Example:
//
// Input:
// [
//  [ 1, 2, 3 ],
//  [ 4, 5, 6 ],
//  [ 7, 8, 9 ]
// ]
//
// Output:  [1,2,4,7,5,3,6,8,9]
//

class Solution {
    public int[] findDiagonalOrder(int[][] matrix) {
        if (matrix.length == 0) return new int[] {};

        int m = matrix.length;
        int n = matrix[0].length;
        int count = m + n - 1;
        int[] result = new int[m * n];

        int di = -1;
        int i = 0;
        int j = 0;
        int idx = 0;
        for (int s = 0; s < count; s++) {
            j = s - i;
            while (i >= 0 && i < m && j >= 0 && j < n) {
                result[idx] = matrix[i][j];
                idx++;
                i += di;
                j = s - i;
            }
            if (j == n) {
                i += 2;
            } else if (i < 0) {
                i = 0;
            } else if (i == m) {
                i = m - 1;
            }
            di = -di;
        }

        return result;
    }
}
