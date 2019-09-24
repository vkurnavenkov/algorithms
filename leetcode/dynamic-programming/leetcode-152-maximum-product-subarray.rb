# Leetcode 152. Maximum Product Subarray
#
# Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.
#
# Example 1:
#
# Input: [2,3,-2,4]
# Output: 6
# Explanation: [2,3] has the largest product 6.
# Example 2:
#
# Input: [-2,0,-1]
# Output: 0
# Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
#

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
    return 0 if nums.empty?

    result = nums[0]
    cur_min = result
    cur_max = result
    (1...nums.size).each do |i|
        old_min = cur_min
        cur_min = [nums[i], cur_min * nums[i], cur_max * nums[i]].min
        cur_max = [nums[i], old_min * nums[i], cur_max * nums[i]].max
        result = [result, cur_max].max
    end

    result
end
