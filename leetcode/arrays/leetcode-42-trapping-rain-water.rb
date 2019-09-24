# LeetCode 42. Trapping Rain Water
# https://leetcode.com/problems/trapping-rain-water/
#
# Given n non-negative integers representing an elevation map where the width of each bar is 1,
# compute how much water it is able to trap after raining.
#
# The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
# In this case, 6 units of rain water (blue section) are being trapped.
#
# Example:
#
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6
#

# Solution 1.
# Two pointers.
#

# @param {Integer[]} height
# @return {Integer}
def trap(height)
    l = 0
    r = height.size - 1
    left_max = height[l]
    right_max = height[r]
    result = 0
    while l < r
        if height[l] < height[r]
            left_max = [left_max, height[l]].max
            result += left_max - height[l]
            l += 1
        else
            right_max = [right_max, height[r]].max
            result += right_max - height[r]
            r -= 1
        end
    end
    result
end
