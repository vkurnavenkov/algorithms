# LeetCode 311. Sparse Matrix Multiplication
# https://leetcode.com/problems/sparse-matrix-multiplication/
#
# Given two sparse matrices A and B, return the result of AB.
#
# You may assume that A's column number is equal to B's row number.
#
# Example:
#
# Input:
#
# A = [
#   [ 1, 0, 0],
#   [-1, 0, 3]
# ]
#
# B = [
#   [ 7, 0, 0 ],
#   [ 0, 0, 0 ],
#   [ 0, 0, 1 ]
# ]
#
# Output:
#
#      |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
# AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
#                   | 0 0 1 |
#

# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def multiply(a, b)
    result = Array.new(a.size) { Array.new(b[0].size) }
    a.size.times do |r|
        b[0].size.times do |c|
            sum = 0
            a[0].size.times do |k|
                sum += a[r][k] * b[k][c]
            end
            result[r][c] = sum
        end
    end
    result
end
