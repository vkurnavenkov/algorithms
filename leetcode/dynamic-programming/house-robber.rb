# Given a list of non-negative integers representing the amount of money of each house,
# determine the maximum amount of money you can rob tonight without alerting the police.
#
# f(k) = max(f(k – 2) + Ak, f(k – 1))
#
def rob_dp(nums)
  return 0 if nums.empty?
  return nums[0] if nums.size == 1
  dp = Array.new(nums.size + 1, 0)
  (0..nums.size - 1).each do |i|
    sum2 = (i - 2 >= 0 ? dp[i - 1] : 0) + nums[i]
    dp[i + 1] = [dp[i], sum2].max
  end
  dp[nums.size]
end

def rob(nums)
  return 0 if nums.empty?
  return nums[0] if nums.size == 1
  prev_sum, sum = nums[0], nums[0, 2].max
  (2..nums.size - 1).each do |i|
    prev_sum, sum = sum, [sum, prev_sum + nums[i]].max
  end
  sum
end

puts rob([1,2,3,1]) # 4
puts rob([1,2,5,3,1]) # 7
puts rob([2,7,9,3,1]) # 12
