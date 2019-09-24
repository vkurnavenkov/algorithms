# Given an integer array nums, find the contiguous subarray (containing at least one number)
# which has the largest sum and return its sum.
#
# Example:
#
# Input: [-2,1,-3,4,-1,2,1,-5,4],
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.
#
# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.empty?
  max_val = nums[0]
  cur_val = nums[0]
  for i in 1..nums.size - 1
    cur_val = [cur_val + nums[i], nums[i]].max
    max_val = cur_val if max_val < cur_val
  end
  max_val
end

puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) # 6
