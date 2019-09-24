# Consider a row of n coins of values v1 . . . vn, where n is even.
# We play a game against an opponent by alternating turns.
# In each turn, a player selects either the first or last coin from the row,
# removes it from the row permanently, and receives the value of the coin.
# Determine the maximum possible amount of money we can definitely win if we move first.
#
# Note: The opponent is as clever as the user.
#
# Examples:
#   5, 3, 7, 10 : The user collects maximum value as 15(10 + 5)
#   8, 15, 3, 7 : The user collects maximum value as 22(7 + 15)
#

def optimal_strategy(*coins)
  dp = Array.new(coins.size) { Array.new(coins.size, 0) }

  (0..coins.size - 1).each do |d|
    i = 0
    j = i + d
    while i < coins.size && j < coins.size
      val1 = (i + 2) <= j ? dp[i + 2][j] : 0
      val2 = (i + 1) <= (j - 1) ? dp[i + 1][j - 1] : 0
      val3 = i <= (j - 2) ? dp[i][j - 2] : 0
      dp[i][j] = [
        coins[i] + [val1, val2].min,
        coins[j] + [val3, val2].min
      ].max
      i += 1
      j += 1
    end
  end
  dp[0][coins.size - 1]
end

puts optimal_strategy(8, 15, 3, 7) # 22
puts optimal_strategy(2, 2, 2, 2) # 4
puts optimal_strategy(20, 30, 2, 2, 2, 10) # 42
