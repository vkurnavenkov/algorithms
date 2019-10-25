# LeetCode 300. Longest Increasing Subsequence
# https://leetcode.com/problems/longest-increasing-subsequence/
#
# Given an unsorted array of integers, find the length of longest increasing subsequence.
#
# Example:
#
# Input: [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
# Note:
#
# There may be more than one LIS combination, it is only necessary for you to return the length.
# Your algorithm should run in O(n2) complexity.
# Follow up: Could you improve it to O(n log n) time complexity?
#

# Solution 1.
# Runtime complexity: O(n^2)
# Space complexity: O(n)
#

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
    return nums.size if nums.size == 0 || nums.size == 1

    dp = Array.new(nums.size, 0)
    dp[0] = 1
    max_len = 1

    (0...nums.size).each do |i|
        (0...i).each do |j|
            val = nums[i] > nums[j] ? dp[j] : 0
            dp[i] = [dp[i], val + 1].max
        end
        max_len = dp[i] if dp[i] > max_len
    end
    max_len
end
