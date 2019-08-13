# Gaussian Elimination to Solve Linear Equations
#
# Input: For N unknowns, input is an augmented matrix of size N x (N+1).
# The most right column is a Right Hand Side (RHS)
#

class Solution
  attr_reader :matrix

  def initialize(matrix)
    @matrix = matrix
  end

  def solve_equation
    n = matrix.size
    (0...n).each do |i|
      pivot = matrix[i][i] == 0 ? find_pivot(matrix, i) : i
      swap_rows(matrix, i, pivot) if i != pivot
      return [] unless scale_row(matrix, i)

      subtract_row(matrix, i)
    end

    build_solution(matrix)
  end

  def print_matrix
    puts ' -------- '
    (0...matrix.size).each do |i|
      puts matrix[i].to_s
    end
  end

  private

  def find_pivot(matrix, row)
    rv = row + 1
    while rv < matrix.size && matrix[rv][row] == 0
      rv += 1
    end
    rv
  end

  def swap_rows(matrix, row1, row2)
    (0...matrix[0].size).each do |i|
      matrix[row1][i], matrix[row2][i] = matrix[row2][i], matrix[row1][i]
    end
  end

  def scale_row(matrix, row)
    return false if matrix[row][row] == 0

    ratio = 1.0 / matrix[row][row]
    (row...matrix[0].size).each do |i|
      matrix[row][i] *= ratio
    end
    true
  end

  def subtract_row(matrix, pivot)
    (pivot + 1...matrix.size).each do |row|
      ratio = matrix[row][pivot]
      (0...matrix[0].size).each do |i|
        matrix[row][i] -= matrix[pivot][i] * ratio
      end
    end
  end

  def build_solution(matrix)
    n = matrix.size
    result = Array.new(n, 0)
    (n - 1).downto(0).each do |i|
      val = matrix[i, i]
      return [] if val == 0

      result[i] = matrix[i][-1]
      (i + 1...n).each do |j|
        result[i] -= matrix[i][j] * result[j]
      end
    end

    result
  end
end

def read_input
  n = gets.to_i
  matrix = []
  n.times do
    matrix.push(readline.split.map(&:to_i))
  end
  matrix
end


# Solution: [1.0, 5.0, 4.0, 3.0]
def input1
  [
    [1, 0, 0, 0, 1],
    [0, 1, 0, 0, 5],
    [0, 0, 1, 0, 4],
    [0, 0, 0, 1, 3]
  ]
end

# Solution: [3.000000, 1.000000, 2.000000]
def input2
  [
    [3, 2,-4, 3],
    [2, 3, 3, 15],
    [5, -3, 1, 14]
  ]
end

# Solution: [0.200000, 0.400000]
def input3
  [
    [5, -5, -1],
    [-1, -2, -1]
  ]
end

# Solution: [1.00000, 5.00000, 8.00000, 3.00000]
def input4
  [
    [1, 0, 0, 0, 1],
    [0, 0, 0, 1, 3],
    [0, 1, 0, 0, 5],
    [0, 0, 1, 0, 8]
  ]
end

solution = Solution.new(read_input)
# solution.print_matrix
puts solution.solve_equation.map { |v| "%.5f" % v}.join(' ')
