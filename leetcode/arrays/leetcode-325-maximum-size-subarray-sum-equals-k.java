// LeetCode 325. Maximum Size Subarray Sum Equals k
// https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
//
// Given an array nums and a target value k, find the maximum length of a subarray that sums to k.
// If there isn't one, return 0 instead.
//
// Note:
// The sum of the entire nums array is guaranteed to fit within the 32-bit signed integer range.
//
// Example 1:
//
// Input: nums = [1, -1, 5, -2, 3], k = 3
// Output: 4
// Explanation: The subarray [1, -1, 5, -2] sums to 3 and is the longest.
// Example 2:
//
// Input: nums = [-2, -1, 2, 1], k = 1
// Output: 2
// Explanation: The subarray [-1, 2] sums to 1 and is the longest.
// Follow Up:
// Can you do it in O(n) time?
//

class Solution {
    public int maxSubArrayLen(int[] nums, int k) {
        int[] prefixes = new int[nums.length + 1];
        for (int i = 0; i < nums.length; i++) {
            prefixes[i + 1] = prefixes[i] + nums[i];
        }

        int maxLen = 0;
        Map<Integer, Integer> map = new HashMap();
        for (int i = 0; i < prefixes.length; i++) {
            if (map.containsKey(prefixes[i])) {
                int len = i - map.get(prefixes[i]);
                if (len > maxLen) maxLen = len;
            }
            if (!map.containsKey(k + prefixes[i])) map.put(k + prefixes[i], i);
        }
        return maxLen;
    }
}
