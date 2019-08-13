// Leetcode 5. Longest Palindromic Substring
//
// Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
//
// Example 1:
//
// Input: "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.
// Example 2:
//
// Input: "cbbd"
// Output: "bb"
//

class Solution {
    public String longestPalindrome(String s) {
        if (s.length() == 0) return "";

        int left = 0;
        int right = 0;
        int len, len2;
        for (int i = 0; i < s.length(); i++) {
            len = maxPalindrome(s, i, i);
            len2 = maxPalindrome(s, i, i + 1);
            if (len2 > len) len = len2;
            if (len > right - left + 1) {
                left = i - (len - 1) / 2;
                right = i + len / 2;
            }
        }
        return s.substring(left, right + 1);
    }

    private int maxPalindrome(String s, int left, int right) {
        while (left >= 0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
            left--;
            right++;
        }
        return right - left - 1;
    }
}
