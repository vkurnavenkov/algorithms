# LeetCode 560. Subarray Sum Equals K
# https://leetcode.com/problems/subarray-sum-equals-k/
#
# Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
#
# Example 1:
# Input:nums = [1,1,1], k = 2
# Output: 2
# Note:
# The length of the array is in range [1, 20,000].
# The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
    prefixes = Array.new(nums.size + 1)
    prefixes[0] = 0
    (1...prefixes.size).each do |i|
        prefixes[i] = prefixes[i - 1] + nums[i - 1]
    end

    map = {}
    count = 0
    prefixes.each.with_index do |p, i|
        if map.key?(p)
            count += map[p].size
        end
        val = p + k
        if map.key?(val)
            map[val].push(i)
        else
            map[val] = [i]
        end
    end
    count
end
