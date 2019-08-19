// Leetcode 34. Find First and Last Position of Element in Sorted Array
//
// Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
//
// Your algorithm's runtime complexity must be in the order of O(log n).
//
// If the target is not found in the array, return [-1, -1].
//
// Example 1:
//
// Input: nums = [5,7,7,8,8,10], target = 8
// Output: [3,4]
// Example 2:
//
// Input: nums = [5,7,7,8,8,10], target = 6
// Output: [-1,-1]
//

class Solution {
    public int[] searchRange(int[] nums, int target) {
        int[] solution = {-1, -1};
        if (nums.length == 0) return solution;
        int l = 0;
        int r = nums.length - 1;
        int m;
        while (l < r) {
            m = (r + l) / 2;
            if (nums[m] < target) {
                l = m + 1;
            } else {
                r = m;
            }
        }

        if (nums[l] != target) return solution;

        int leftmost = l;
        l = 0;
        r = nums.length - 1;
        while (l < r) {
            m = (r + l + 1) / 2;
            if (target < nums[m]) {
                r = m - 1;
            } else {
                l = m;
            }
        }

        solution[0] = leftmost;
        solution[1] = r;
        return solution;
    }
}
