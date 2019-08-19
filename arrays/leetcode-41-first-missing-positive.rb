# Leetcode 41. First Missing Positive
#
# Given an unsorted integer array, find the smallest missing positive integer.
#
# Example 1:
#
# Input: [1,2,0]
# Output: 3
# Example 2:
#
# Input: [3,4,-1,1]
# Output: 2
# Example 3:
#
# Input: [7,8,9,11,12]
# Output: 1
# Note:
#
# Your algorithm should run in O(n) time and uses constant extra space.
#

# Solution 1 (Accepted)
# Time: O(n)
# Space: O(n)
#
# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
    n = nums.size
    cache = Array.new(n + 1, false)
    nums.each do |v|
        if v > 0 && v <= n + 1
            cache[v - 1] = true
        end
    end

    (0...cache.size).each do |i|
        return i + 1 unless cache[i]
    end
    1
end

# Solution 2 (Accepted)
# Runtime: O(n)
# Space: O(1)
#
# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
    n = nums.size

    # Replace all values >= n and <= 0 as they are not solution
    # (except n + 1, which is the edge case)
    one_found = false
    (0...n).each do |i|
        one_found ||= nums[i] == 1
        if nums[i] > n || nums[i] <= 0
            nums[i] = 1
        end
    end

    # 1 has not been found, it's a solution (edge case)
    return 1 unless one_found

    # Go through the array and replace found values with negative ones
    (0...n).each do |i|
        idx = nums[i].abs
        if nums[idx - 1] > 0
            nums[idx - 1] = -nums[idx - 1]
        end
    end

    # Detect a result
    (0...n).each do |i|
        return i + 1 if nums[i] > 0
    end
    n + 1
end
