// LeetCode 84. Largest Rectangle in Histogram
// https://leetcode.com/problems/largest-rectangle-in-histogram/
//
// Given n non-negative integers representing the histogram's bar height where the width of each bar is 1,
// find the area of largest rectangle in the histogram.
//
// Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
//
// The largest rectangle is shown in the shaded area, which has area = 10 unit.
//
// Example:
//
// Input: [2,1,5,6,2,3]
// Output: 10
//
//
// Solution 1.
// Runtime complexity: O(N^2)
// Space complexity: O(1)
// Tests passed. Toooooo long

class Solution {
    public int largestRectangleArea(int[] heights) {
        int maxArea = 0;
        for (int i = 0; i < heights.length; i++) {
            int minHeight = Integer.MAX_VALUE;
            for (int j = i; j < heights.length; j++) {
                minHeight = Math.min(minHeight, heights[j]);
                maxArea = Math.max(maxArea, minHeight * (j - i + 1));
            }
        }
        return maxArea;
    }
}


// Solution 2.
// Runtime complexity: O(N)
// Space complexity: O(N)
//

class Solution {
    public int largestRectangleArea(int[] heights) {
        int maxSquare = 0;

        Stack<Integer> stack = new Stack();

        int i = 0;
        while (i < heights.length) {
            while (!stack.isEmpty() && heights[i] < heights[stack.peek()]) {
                int idx = stack.pop();
                int square = heights[idx] * (stack.isEmpty() ? i : i - stack.peek() - 1);
                maxSquare = Math.max(maxSquare, square);
            }
            stack.push(i++);
        }

        while (!stack.isEmpty()) {
            int idx = stack.pop();
            int square = heights[idx] * (stack.isEmpty() ? heights.length : heights.length - stack.peek() - 1);
            maxSquare = Math.max(maxSquare, square);
        }

        return maxSquare;
    }
}
