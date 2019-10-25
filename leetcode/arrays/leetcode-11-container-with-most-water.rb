# LeetCode 11. Container With Most Water
# https://leetcode.com/problems/container-with-most-water/
#
# Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai).
# n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0).
# Find two lines, which together with x-axis forms a container, such that the container contains the most water.
#
# Note: You may not slant the container and n is at least 2.
#
# The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
# In this case, the max area of water (blue section) the container can contain is 49.
#
# Example:
#
# Input: [1,8,6,2,5,4,8,3,7]
# Output: 49
#

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    l = 0
    r = height.size - 1
    max_area = 0
    while l < r
        area = [height[l], height[r]].min * (r - l)
        max_area = area if area > max_area
        if height[l] < height[r]
            l += 1
        else
            r -= 1
        end
    end
    max_area
end
