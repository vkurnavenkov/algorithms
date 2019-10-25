# LeetCode 325. Maximum Size Subarray Sum Equals k
# https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
#
# Given an array nums and a target value k, find the maximum length of a subarray that sums to k. If there isn't one, return 0 instead.
#
# Note:
# The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.
#
# Example 1:
#
# Input: nums = [1, -1, 5, -2, 3], k = 3
# Output: 4
# Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.
# Example 2:
#
# Input: nums = [-2, -1, 2, 1], k = 1
# Output: 2
# Explanation: The subarray [-1, 2] sums to 1 and is the longest.
# Follow Up:
# Can you do it in O(n) time?
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_sub_array_len(nums, k)
    prefixes = Array.new(nums.size + 1)
    prefixes[0] = 0
    nums.each.with_index do |n, i|
        prefixes[i + 1] = prefixes[i] + n
    end

    map = {}
    max_len = 0
    prefixes.each.with_index do |n, i|
        if map.key?(n)
            len = i - map[n]
            max_len = len if len > max_len
        end
        map[k + n] = i unless map.key?(k + n)
    end

    max_len
end
