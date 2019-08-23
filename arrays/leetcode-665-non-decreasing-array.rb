# Leetcode 665. Non-decreasing Array
#
# Given an array with n integers, your task is to check if it could become non-decreasing by modifying at most 1 element.
#
# We define an array is non-decreasing if array[i] <= array[i + 1] holds for every i (1 <= i < n).
#
# Example 1:
# Input: [4,2,3]
# Output: True
# Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
# Example 2:
# Input: [4,2,1]
# Output: False
# Explanation: You can't get a non-decreasing array by modify at most one element.
# Note: The n belongs to [1, 10,000].
#

# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
    error = nil
    (0..nums.size - 2).each do |i|
        if nums[i] > nums[i + 1]
            return false if error
            error = i
        end
    end
    !error || error == 0 || error == nums.size - 2 ||
        nums[error - 1] <= nums[error + 1] || nums[error] <= nums[error + 2]
end
