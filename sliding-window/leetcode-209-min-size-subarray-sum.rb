# Leetcode 209. Minimum Size Subarray Sum
#
# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
#
# Example:
#
# Input: s = 7, nums = [2,3,1,2,4,3]
# Output: 2
# Explanation: the subarray [4,3] has the minimal length under the problem constraint.
#

# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
    left = 0
    cur_sum = 0
    result = 0

    nums.size.times do |right|
        cur_sum += nums[right]
        while cur_sum >= s
            length = right - left + 1
            result = result == 0 ? length : [result, length].min
            cur_sum -= nums[left]
            left += 1
        end
    end

    result
end
