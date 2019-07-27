// Leetcode 209. Minimum Size Subarray Sum
//
// Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
//
// Example:
//
// Input: s = 7, nums = [2,3,1,2,4,3]
// Output: 2
// Explanation: the subarray [4,3] has the minimal length under the problem constraint.
//

class Solution {
    public int minSubArrayLen(int s, int[] nums) {
        int l = 0;
        int curSum = 0;
        int result = Integer.MAX_VALUE;

        for (int r = 0; r < nums.length; r++) {
            curSum += nums[r];
            while (curSum >= s) {
                result = Math.min(result, r - l + 1);
                curSum -= nums[l++];
            }
        }

        return result == Integer.MAX_VALUE ? 0 : result;
    }
}
