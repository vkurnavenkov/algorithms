# Leetcode: 63. Unique Paths II
#
# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
#
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
#
# An obstacle and empty space is marked as 1 and 0 respectively in the grid.
#
# Note: m and n will be at most 100.
#
# Example 1:
#
# Input:
# [
#   [0,0,0],
#   [0,1,0],
#   [0,0,0]
# ]
#
# Output: 2
#
# Explanation:
# There is one obstacle in the middle of the 3x3 grid above.
# There are two ways to reach the bottom-right corner:
# 1. Right -> Right -> Down -> Down
# 2. Down -> Down -> Right -> Right
#

# @param {Integer[][]} obstacle_grid
# @return {Integer}

# Runtime complexity: O(n*m)
# Space complexity: O(n*m)
def unique_paths_with_obstacles_2d(obstacle_grid)
  return 0 if obstacle_grid.empty?
  n = obstacle_grid.size
  m = obstacle_grid[0].size
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = 1
  (0..n-1).each do |r|
      (0..m-1).each do |c|
          if obstacle_grid[r][c] == 1
              dp[r][c] = 0
          elsif c > 0 || r > 0
              dp[r][c] = (c == 0 ? 0 : dp[r][c - 1]) + (r == 0 ? 0 : dp[r - 1][c])
          end
      end
  end
  dp[n - 1][m - 1]
end

# Runtime complexity: O(n*m)
# Space complexity: O(m)
def unique_paths_with_obstacles(obstacle_grid)
    return 0 if obstacle_grid.empty?
    n = obstacle_grid.size
    m = obstacle_grid[0].size
    dp = Array.new(m, 0)
    dp[0] = 1
    (0..n-1).each do |r|
        (0..m-1).each do |c|
            if obstacle_grid[r][c] == 1
                dp[c] = 0
            elsif c > 0
                dp[c] += dp[c - 1]
            end
        end
    end
    dp[m - 1]
end

puts unique_paths_with_obstacles_2d([[0,0,0],[0,1,0],[0,0,0]]) # 2
puts unique_paths_with_obstacles_2d([[1,0,0]]) # 0

puts unique_paths_with_obstacles([[0,0,0],[0,1,0],[0,0,0]]) # 2
puts unique_paths_with_obstacles([[1,0,0]]) # 0

[3,4,2,3] # false
[4,2,3] # true
