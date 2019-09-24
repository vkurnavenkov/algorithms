// LeetCode 42. Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/
//
// Given n non-negative integers representing an elevation map where the width of each bar is 1,
// compute how much water it is able to trap after raining.
//
// The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
// In this case, 6 units of rain water (blue section) are being trapped.
//
// Example:
//
// Input: [0,1,0,2,1,0,1,3,2,1,2,1]
// Output: 6
//

class Solution {
    public int trap(int[] height) {
        int l = 0, r = height.length - 1, waterlevel = 0, trap = 0;
        while (l < r) {
            int lowergrounds = height[l] < height[r] ? height[l++] : height[r--];
            waterlevel = Math.max(waterlevel, lowergrounds);
            trap += waterlevel - lowergrounds;
        }
        return trap;
    }
}
