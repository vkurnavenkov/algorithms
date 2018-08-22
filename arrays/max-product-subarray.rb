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
    max_product = nums[0]
    min_product = nums[0]
    product = nums[0]
    for i in 1..nums.size - 1
        prev_max_product = max_product
        max_product = [prev_max_product * nums[i], min_product * nums[i], nums[i]].max
        min_product = [prev_max_product * nums[i], min_product * nums[i], nums[i]].min
        product = [product, max_product].max
    end
    product
end

puts max_product([2,3,-2,4]) # 6
puts max_product([-2,0,-1]) # 0
puts max_product([2,3,-2,-4]) # 48
