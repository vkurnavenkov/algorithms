// LeetCode 673. Number of Longest Increasing Subsequence
// https://leetcode.com/problems/number-of-longest-increasing-subsequence/
//
// Given an unsorted array of integers, find the number of longest increasing subsequence.
//
// Example 1:
// Input: [1,3,5,4,7]
// Output: 2
// Explanation: The two longest increasing subsequence are [1, 3, 4, 7] and [1, 3, 5, 7].
// Example 2:
// Input: [2,2,2,2,2]
// Output: 5
// Explanation: The length of longest continuous increasing subsequence is 1, and there are 5 subsequences' length is 1, so output 5.
// Note: Length of the given array will be not exceed 2000 and the answer is guaranteed to be fit in 32-bit signed int.
//

class Solution {
    public int findNumberOfLIS(int[] nums) {
        if (nums.length == 0 || nums.length == 1) return nums.length;

        int[] lengths = new int[nums.length];
        int[] counts = new int[nums.length];
        lengths[0] = 1;
        counts[0] = 1;
        int maxLen = 1;

        for (int i = 1; i < nums.length; i++) {
            int len = 1;
            int count = 1;
            for (int j = 0; j < i; j++) {
                if (nums[j] < nums[i]) {
                    int newLen = lengths[j] + 1;
                    int newCount = counts[j];
                    if (len < newLen) {
                        len = newLen;
                        count = newCount;
                    } else if (len == newLen) {
                        count += newCount;
                    }
                }
            }
            lengths[i] = len;
            counts[i] = count;
            maxLen = Math.max(maxLen, len);
        }

        int maxCount = 0;
        for (int i = 0; i < nums.length; i++) {
            if (lengths[i] == maxLen) maxCount += counts[i];
        }

        return maxCount;
    }
}
