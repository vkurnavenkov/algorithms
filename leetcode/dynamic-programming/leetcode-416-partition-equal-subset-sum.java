// LeetCode 416. Partition Equal Subset Sum
//
// Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
//
// Note:
//
// Each of the array element will not exceed 100.
// The array size will not exceed 200.
//
//
// Example 1:
//
// Input: [1, 5, 11, 5]
//
// Output: true
//
// Explanation: The array can be partitioned as [1, 5, 5] and [11].
//
//
// Example 2:
//
// Input: [1, 2, 3, 5]
//
// Output: false
//
// Explanation: The array cannot be partitioned into equal sum subsets.
//

class Solution {
    public boolean canPartition(int[] nums) {
        int sum = 0;
        for (int n: nums) sum += n;

        if (sum % 2 == 1) return false;

        sum /= 2;
        boolean[] dp = new boolean[sum + 1];
        dp[0] = true;
        for (int n: nums) {
            if (n > sum) return false;

            for (int i = sum; i > 0; i--) {
                if (n <= i) dp[i] = dp[i] || dp[i - n];
            }
        }

        return dp[sum];
    }
}