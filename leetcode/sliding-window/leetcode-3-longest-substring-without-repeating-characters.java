// Leetcode 3. Longest Substring Without Repeating Characters
//
// Given a string, find the length of the longest substring without repeating characters.
//
// Example 1:
//
// Input: "abcabcbb"
// Output: 3
// Explanation: The answer is "abc", with the length of 3.
// Example 2:
//
// Input: "bbbbb"
// Output: 1
// Explanation: The answer is "b", with the length of 1.
// Example 3:
//
// Input: "pwwkew"
// Output: 3
// Explanation: The answer is "wke", with the length of 3.
//              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
//

class Solution {
    public int lengthOfLongestSubstring(String s) {
        Set<Character> set = new HashSet();

        int l = 0;
        int maxCount = 0;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (set.contains(c)) {
                while (s.charAt(l) != c) {
                    set.remove(s.charAt(l));
                    l++;
                }
                l++;
            } else {
                set.add(c);
            }
            maxCount = Math.max(maxCount, i - l + 1);
        }
        return maxCount;
    }
}
