# Leetcode 34. Find First and Last Position of Element in Sorted Array
#
# Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
#
# Your algorithm's runtime complexity must be in the order of O(log n).
#
# If the target is not found in the array, return [-1, -1].
#
# Example 1:
#
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]
# Example 2:
#
# Input: nums = [5,7,7,8,8,10], target = 6
# Output: [-1,-1]
#

# Solution 1
# Runtime complexity: O(n) as (logN + N)

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    left = 0
    right = nums.size - 1
    idx = -1
    while left <= right && idx < 0
        medium = (right + left + 1) / 2
        if nums[medium] == target
            idx = medium
        elsif nums[medium] > target
            right = medium - 1
        else
            left = medium + 1
        end
    end

    return [-1, -1] if idx < 0

    left = idx
    right = idx
    while left > 0 && nums[left - 1] == target
        left -= 1
    end

    while right < nums.size - 1 && nums[right + 1] == target
        right += 1
    end

    [left, right]
end


# Solution 2
# Runtime complexity: O(log(n))

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    # Looking for leftmost target
    left = 0
    right = nums.size - 1
    while left < right
        medium = (right + left) / 2
        if nums[medium] < target
            left = medium + 1
        else
            right = medium
        end
    end
    leftmost = left

    return [-1, -1] if nums[leftmost] != target

    # Looking for leftmost target
    left = 0
    right = nums.size - 1
    while left < right
        medium = (right + left + 1) / 2
        if nums[medium] > target
            right = medium - 1
        else
            left = medium
        end
    end

    [leftmost, right]
end
