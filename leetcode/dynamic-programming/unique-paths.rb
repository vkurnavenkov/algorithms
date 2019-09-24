# Leetcode 62. Unique Paths
#
# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
#
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
#
# Note: m and n will be at most 100.
#
# Example 1:
#
# Input: m = 3, n = 2
# Output: 3
# Explanation:
# From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Right -> Down
# 2. Right -> Down -> Right
# 3. Down -> Right -> Right
# Example 2:
#
# Input: m = 7, n = 3
# Output: 28
#


# @param {Integer} m
# @param {Integer} n
# @return {Integer}
#
# Runtime complexity: O(n*m)
# Space complexity: O(n*m)
def unique_paths_dp(m, n)
    dp = Array.new(n) { Array.new(m, 0) }
    n.times { |r| dp[r][0] = 1 }
    m.times { |c| dp[0][c] = 1 }
    (1..n-1).each do |r|
        (1..m-1).each do |c|
            dp[r][c] = dp[r - 1][c] + dp[r][c - 1]
        end
    end
    dp[n - 1][m - 1]
end

# See Pascal's Triangle for details
# c(n, k) = c(n, k - 1) * (n - k + 1) / k
#
# Runtime complexity: O(min(n, m))
def unique_paths(m, n)
    result = 1
    k = [m, n].min - 1
    t = m + n - 2
    (1..k).each do |i|
        result = result * (t - i + 1) / i
    end
    result
end

puts unique_paths_dp(7, 3) # 28
puts unique_paths_dp(3, 2) # 3

puts unique_paths(7, 3) # 28
puts unique_paths(3, 2) # 3
