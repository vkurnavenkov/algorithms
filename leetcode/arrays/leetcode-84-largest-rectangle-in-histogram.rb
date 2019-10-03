# LeetCode 84. Largest Rectangle in Histogram
# https://leetcode.com/problems/largest-rectangle-in-histogram/
#
# Given n non-negative integers representing the histogram's bar height where the width of each bar is 1,
# find the area of largest rectangle in the histogram.
#
# Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
#
# The largest rectangle is shown in the shaded area, which has area = 10 unit.
#
# Example:
#
# Input: [2,1,5,6,2,3]
# Output: 10
#

# Solution 1.
# Time Limit Exceeded
# Runtime complexity: O(NlogN)
# Space complexity: O(1)
#

class Solution
    def solve(heights)
        solve_interval(heights, 0, heights.size - 1)
    end

    private

    def solve_interval(heights, l, r)
        return 0 if l > r

        min_index = min_height_index(heights, l, r)
        square = heights[min_index] * (r - l + 1)
        [
            square,
            solve_interval(heights, l, min_index - 1),
            solve_interval(heights, min_index + 1, r)
        ].max
    end

    def min_height_index(heights, l, r)
        result = r
        (l...r).each do |i|
            result = i if heights[i] < heights[result]
        end
        result
    end
end

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
    Solution.new.solve(heights)
end

# Solution 2.
# Runtime complexity: O(N)
# Space complexity: O(N)
#

class Solution
    def solve(heights)
        max_square = 0
        stack = []

        stack.push(-1)
        (0...heights.size).each do |i|
            while stack.last != -1 && heights[stack.last] > heights[i]
                idx = stack.pop
                max_square = [max_square, heights[idx] * (i - stack.last - 1)].max
            end
            stack.push(i)
        end
        while stack.last != -1
            idx = stack.pop
            max_square = [max_square, heights[idx] * (heights.size - stack.last - 1)].max
        end
        max_square
    end
end

# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
    Solution.new.solve(heights)
end
