# Leetcode 51. N-Queens
#
# The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
#
# Given an integer n, return all distinct solutions to the n-queens puzzle.
#
# Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
#
# Example:
#
# Input: 4
# Output: [
#  [".Q..",  // Solution 1
#   "...Q",
#   "Q...",
#   "..Q."],
#
#  ["..Q.",  // Solution 2
#   "Q...",
#   "...Q",
#   ".Q.."]
# ]
# Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
#

# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
    results = []
    queens = Array.new(n)
    cols = Array.new(n, false)
    diagonal_up = Array.new(2 * n - 1, false)
    diagonal_down = Array.new(2 * n - 1, false)
    backtrack(queens, cols, diagonal_up, diagonal_down, 0, results)
    results
end

def backtrack(queens, cols, diagonal_up, diagonal_down, row, results)
    n = queens.size
    if row == n
        # Solution found
        results.push(build_solution(queens))
        return
    end
    n.times do |c|
        if !cell_under_attack?(queens, cols, diagonal_up, diagonal_down, row, c)
            place_queen(queens, cols, diagonal_up, diagonal_down, row, c, true)
            backtrack(queens, cols, diagonal_up, diagonal_down, row + 1, results)
            place_queen(queens, cols, diagonal_up, diagonal_down, row, c, false)
        end
    end
end

def place_queen(queens, cols, diagonal_up, diagonal_down, row, col, value)
    queens[row] = value ? col : nil
    cols[col] = value
    diagonal_up[row + col] = value
    diagonal_down[queens.size - 1 + row - col] = value
end

def cell_under_attack?(queens, cols, diagonal_up, diagonal_down, row, col)
    cols[col] || diagonal_up[row + col] || diagonal_down[queens.size - 1 + row - col]
end

def build_solution(queens)
    n = queens.size
    queens.map { |col| ('.' * n).tap { |dots| dots[col] = 'Q' } }
end
