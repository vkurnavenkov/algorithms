// LeetCode 91. Decode Ways
// https://leetcode.com/problems/decode-ways/
//
// A message containing letters from A-Z is being encoded to numbers using the following mapping:
//
// 'A' -> 1
// 'B' -> 2
// ...
// 'Z' -> 26
// Given a non-empty string containing only digits, determine the total number of ways to decode it.
//
// Example 1:
//
// Input: "12"
// Output: 2
// Explanation: It could be decoded as "AB" (1 2) or "L" (12).
// Example 2:
//
// Input: "226"
// Output: 3
// Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
//

class Solution {
    public int numDecodings(String s) {
        if (s.length() == 0) return 0;

        int prev = s.charAt(0) - '0';
        if (prev == 0) return 0;

        int dp1 = 1;
        int dp2 = 1;
        for (int i = 1; i < s.length(); i++) {
            int dp = 0;
            int cur = s.charAt(i) - '0';
            if (cur > 0) dp += dp1;

            if (prev > 0) {
                int two = prev * 10 + cur;
                if (two > 0 && two <= 26) {
                    dp += dp2;
                }
            }
            dp2 = dp1;
            dp1 = dp;
            prev = cur;
        }
        return dp1;
    }
}
