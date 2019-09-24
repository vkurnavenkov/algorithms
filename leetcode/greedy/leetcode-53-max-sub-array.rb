# Leetcode 53. Maximum Subarray
#
# Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
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

    result = nums[0]
    sum = result
    (1...nums.size).each do |i|
        sum = [sum + nums[i], nums[i]].max
        result = [result, sum].max
    end
    result
end
