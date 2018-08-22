# There are n stairs, a person standing at the bottom wants to reach the top.
# The person can climb either 1 stair, 2 or 3 stairs at a time.
# Count the number of ways, the person can reach the top
# (Common case: 1..M stairs)
#
# ways(n) = ways(n-1) + ways(n-2) + ways(n-3)
# Common case:
# ways(n, m) = ways(n-1, m) + ways(n-2, m) + ... + ways(n-m, m)

def count_ways(n)
  return 0 if n <= 0
  dp = Array.new(n + 1)
  dp[0] = 1
  (1..n).each do |i|
    result = 0
    (1..3).each do |j|
      result += dp[i - j] if i - j >= 0
    end
    dp[i] = result
  end
  dp[n]
end

def count_ways_recur(n)
  def _recur(k, dp)
    return 0 if k < 0
    return dp[k] if dp[k]
    result = 0
    (1..3).each do |j|
      result += _recur(k - j, dp)
    end
    dp[k] = result
  end

  return 0 if n <= 0
  dp = Array.new(n + 1)
  dp[0] = 1
  _recur(n, dp)
end


puts count_ways(-1) # 0
puts count_ways(0) # 0
puts count_ways(1) # 1
puts count_ways(2) # 2
puts count_ways(3) # 4
puts count_ways(4) # 7
puts count_ways(5) # 13
puts count_ways(21) # 223317

puts count_ways_recur(-1) # 0
puts count_ways_recur(0) # 0
puts count_ways_recur(1) # 1
puts count_ways_recur(2) # 2
puts count_ways_recur(3) # 4
puts count_ways_recur(4) # 7
puts count_ways_recur(5) # 13
puts count_ways_recur(21) # 223317
