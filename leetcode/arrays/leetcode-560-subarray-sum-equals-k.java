// LeetCode 560. Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/
//
// Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
//
// Example 1:
// Input:nums = [1,1,1], k = 2
// Output: 2
// Note:
// The length of the array is in range [1, 20,000].
// The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
//

class Solution {
    public int subarraySum(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap();
        int count = 0;
        int curSum = 0;
        map.put(0, 1);
        for (int n: nums) {
            curSum += n;
            if (map.containsKey(curSum - k)) {
                count += map.get(curSum - k);
            }
            map.put(curSum, map.getOrDefault(curSum, 0) + 1);
        }
        return count;
    }
}
