# Given an array of positive integers. Split it into 2 parts where sums of left and right parts are equal.
#
# Example 1:
# [3, 2, 4, 1] -> 2 (as [[3, 2], [4, 1]], where 2 is an index of the right subarray)
#
# Example 2:
# [3, 5, 1, 2, 7] -> 3 (as [[3, 5, 1], [2, 7]], where 3 is an index of the right subarray)
#
# Example 3:
# [3, 2, 1, 2, 3] -> nil (as impossible to split the given array)
#

def split_array(nums)
  return nil if nums.size <= 1
  l_sum = nums[0]
  r_sum = nums[-1]
  l_idx = 1
  r_idx = nums.size - 2
  while l_idx <= r_idx
    if l_sum < r_sum
      l_sum += nums[l_idx]
      l_idx += 1
    else
      r_sum += nums[r_idx]
      r_idx -= 1
    end
  end

  l_sum == r_sum ? l_idx : nil
end

puts split_array([3, 2, 4, 1]) # 2
puts split_array([3, 5, 1, 2, 7]) # 3
puts split_array([3, 2, 1, 2, 3]) # nil
puts split_array([8, 1, 3, 2, 3, 1]) # 2
puts split_array([1, 3, 2, 3, 1, 8]) # 4
