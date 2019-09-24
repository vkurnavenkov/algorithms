# Leetcode 37. Sudoku Solver
#
# Write a program to solve a Sudoku puzzle by filling the empty cells.
#
# A sudoku solution must satisfy all of the following rules:
#
# Each of the digits 1-9 must occur exactly once in each row.
# Each of the digits 1-9 must occur exactly once in each column.
# Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
# Empty cells are indicated by the character '.'.
#
# Note:
#
# The given board contain only digits 1-9 and the character '.'.
# You may assume that the given Sudoku puzzle will have a single unique solution.
# The given board size is always 9x9.
#

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
    solution = Solution.new(board)
    solution.solve
    solution.board
end

class Solution
    N = 9
    attr_reader :board

    def initialize(board)
        @board = board
        @rows = Array.new(N) { Array.new(N) }
        @cols = Array.new(N) { Array.new(N) }
        @subboxes = Array.new(N) { Array.new(N) }

        N.times do |row|
            N.times do |col|
                if board[row][col] != '.'
                    d = board[row][col].to_i
                    place_number(d, row, col, true)
                end
            end
        end
    end

    def solve_next(row, col)
      if row == N - 1 && col == N - 1
          return true
      end

      solve(*next_cell(row, col))
    end

    def solve(row = 0, col = 0)
        if @board[row][col] == '.'
            (1..N).each do |d|
                if valid_number?(d, row, col)
                  place_number(d, row, col, true)
                  if solve_next(row, col)
                      return true
                  else
                      place_number(d, row, col, false)
                  end
                end
            end
        else
            return true if solve_next(row, col)
        end

        false
    end

    def place_number(d, row, col, flag)
        @board[row][col] = flag ? d.to_s : '.'
        @rows[row][d - 1] = flag
        @cols[col][d - 1] = flag
        subbox = (row / 3) * 3 + col / 3
        @subboxes[subbox][d - 1] = flag
    end

    def valid_number?(d, row, col)
        subbox = (row / 3) * 3 + col / 3
        !@rows[row][d - 1] && !@cols[col][d - 1] && !@subboxes[subbox][d - 1]
    end

    def next_cell(row, col)
      val = row * N + col + 1
      [val / N, val % N]
    end
end

def run_and_compare(input, expected)
  solution = solve_sudoku(input)

  solution.each do |row|
    puts row.to_s
  end

  if solution == expected
    puts "SOLUTION FOUND!"
  else
    puts "F...!"
  end
end

input = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

expected = [
  ["5","3","4","6","7","8","9","1","2"],
  ["6","7","2","1","9","5","3","4","8"],
  ["1","9","8","3","4","2","5","6","7"],
  ["8","5","9","7","6","1","4","2","3"],
  ["4","2","6","8","5","3","7","9","1"],
  ["7","1","3","9","2","4","8","5","6"],
  ["9","6","1","5","3","7","2","8","4"],
  ["2","8","7","4","1","9","6","3","5"],
  ["3","4","5","2","8","6","1","7","9"]
]

run_and_compare(input, expected)

input2 = [
  [".",".","9","7","4","8",".",".","."],
  ["7",".",".",".",".",".",".",".","."],
  [".","2",".","1",".","9",".",".","."],
  [".",".","7",".",".",".","2","4","."],
  [".","6","4",".","1",".","5","9","."],
  [".","9","8",".",".",".","3",".","."],
  [".",".",".","8",".","3",".","2","."],
  [".",".",".",".",".",".",".",".","6"],
  [".",".",".","2","7","5","9",".","."]
]

expected2 = [
  ["5","1","9","7","4","8","6","3","2"],
  ["7","8","3","6","5","2","4","1","9"],
  ["4","2","6","1","3","9","8","7","5"],
  ["3","5","7","9","8","6","2","4","1"],
  ["2","6","4","3","1","7","5","9","8"],
  ["1","9","8","5","2","4","3","6","7"],
  ["9","7","5","8","6","3","1","2","4"],
  ["8","3","2","4","9","1","7","5","6"],
  ["6","4","1","2","7","5","9","8","3"]
]

run_and_compare(input2, expected2)
