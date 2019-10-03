# LeetCode 283. Move Zeroes
# https://leetcode.com/problems/move-zeroes/
#
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
#
# Example:
#
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
# Note:
#
# You must do this in-place without making a copy of the array.
# Minimize the total number of operations.
#

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
    j = 0
    (0...nums.size).each do |i|
        if nums[i] != 0
            nums[i], nums[j] = nums[j], nums[i]
            j += 1
        end
    end
end
