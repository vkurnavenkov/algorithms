# Leetcode 238. Product of Array Except Self
#
# Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
#
# Example:
#
# Input:  [1,2,3,4]
# Output: [24,12,8,6]
# Note: Please solve it without division and in O(n).
#
# Follow up:
# Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)
#

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
    result = Array.new(nums.size)
    cur_product = 1
    (0...nums.size).each do |i|
        result[i] = cur_product
        cur_product *= nums[i]
    end
    cur_product = 1
    (nums.size - 1).downto(0).each do |i|
        result[i] *= cur_product
        cur_product *= nums[i]
    end
    result
end
