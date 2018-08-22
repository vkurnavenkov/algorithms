# Given a set of non-negative integers, and a value sum, determine
# if there is a subset of the given set with sum equal to given sum.
#
# Examples: set[] = {3, 34, 4, 12, 5, 2}, sum = 9
# Output:  True  //There is a subset (4, 5) with sum 9.
#

def subset_sum?(set, sum)
  n = set.size
  dp = Array.new(n + 1) { Array.new(sum + 1, false) }
  (0..n).each { |i| dp[i][0] = true }
  (1..n).each do |i|
    (1..sum).each do |j|
      val = dp[i - 1][j]
      val ||= dp[i - 1][j - set[i - 1]] if j >= set[i - 1]
      dp[i][j] = val
    end
  end
  dp[n][sum]
end

def subset_sum_optimized?(set, sum)
  n = set.size
  dp = Array.new(2) { Array.new(sum + 1, false) }
  (0..n).each do |i|
    (0..sum).each do |j|
      dp[i % 2][j] =
        if j == 0
          true
        elsif i == 0
          false
        else
          val = dp[(i + 1) % 2][j]
          val ||= dp[(i + 1) % 2][j - set[i - 1]] if j >= set[i - 1]
          val
        end
    end
  end
  dp[n % 2][sum]
end

puts subset_sum?([3, 34, 4, 12, 5, 2], 9) # true
puts subset_sum?([3, 12, 5, 1], 7) # false
puts subset_sum?([3, 2, 6, 10, 5, 8], 7) # true
puts subset_sum?([3, 12, 5, 1], 9) # true
puts '========'
puts subset_sum_optimized?([3, 34, 4, 12, 5, 2], 9) # true
puts subset_sum_optimized?([3, 12, 5, 1], 7) # false
puts subset_sum_optimized?([3, 2, 6, 10, 5, 8], 7) # true
puts subset_sum_optimized?([3, 12, 5, 1], 9) # true
