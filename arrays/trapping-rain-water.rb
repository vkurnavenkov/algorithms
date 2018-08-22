# Given n non-negative integers representing an elevation map where the width of each bar is 1,
# compute how much water it is able to trap after raining.
#
# Input: [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6
#
# @param {Integer[]} height
# @return {Integer}
def trap(height)
    size = height.size
    left = 0
    right = size - 1
    left_max = height[left]
    right_max = height[right]
    result = 0
    while left < right
        # puts "#{left}, #{right}, #{result}"
        if left_max <= right_max
            result += left_max - height[left]
            left += 1
            left_max = [left_max, height[left]].max
        else
            result += right_max - height[right]
            right -= 1
            right_max = [right_max, height[right]].max
        end
    end
    result
end
