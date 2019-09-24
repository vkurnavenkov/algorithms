// Leetcode 51. N-Queens
//
// The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
//
// Given an integer n, return all distinct solutions to the n-queens puzzle.
//
// Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
//
// Example:
//
// Input: 4
// Output: [
//  [".Q..",  // Solution 1
//   "...Q",
//   "Q...",
//   "..Q."],
//
//  ["..Q.",  // Solution 2
//   "Q...",
//   "...Q",
//   ".Q.."]
// ]
// Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
//

class Solution {
    int[] queens;
    boolean[] cols;
    boolean[] diagonalsUp;
    boolean[] diagonalsDown;

    public List<List<String>> solveNQueens(int n) {
        queens = new int[n];
        cols = new boolean[n];
        diagonalsUp = new boolean[2 * n -1];
        diagonalsDown = new boolean[2 * n -1];
        List<List<String>> results = new ArrayList();

        backtrack(0, results);

        return results;
    }

    private void backtrack(int row, List<List<String>> results) {
        int n = queens.length;
        if (row == n) {
            results.add(buildSolution());
            return;
        }

        for (int col = 0; col < n; col++) {
            if (!isUnderAttack(row, col)) {
                placeQueen(row, col, true);
                backtrack(row + 1, results);
                placeQueen(row, col, false);
            }
        }
    }

    private boolean isUnderAttack(int row, int col) {
        return cols[col] || diagonalsUp[row + col] || diagonalsDown[queens.length - 1 + row - col];
    }

    private void placeQueen(int row, int col, boolean flag) {
        queens[row] = flag ? col : 0;
        cols[col] = flag;
        diagonalsUp[row + col] = flag;
        diagonalsDown[queens.length - 1 + row - col] = flag;
    }

    private List<String> buildSolution() {
        List<String> solution = new ArrayList<String>();
        int n = queens.length;
        int col;
        char[] chars;

        for (int row = 0; row < n; row++) {
            col = queens[row];
            chars = new char[n];
            Arrays.fill(chars, '.');
            chars[col] = 'Q';
            solution.add(new String(chars));
        }

        return solution;
    }
}
