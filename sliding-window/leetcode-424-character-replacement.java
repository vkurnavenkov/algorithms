// Leetcode 424. Longest Repeating Character Replacement
//
// Given a string s that consists of only uppercase English letters, you can perform at most k operations on that string.
//
// In one operation, you can choose any character of the string and change it to any other uppercase English character.
//
// Find the length of the longest sub-string containing all repeating letters you can get after performing the above operations.
//
// Note:
// Both the string's length and k will not exceed 104.
//
// Example 1:
//
// Input:
// s = "ABAB", k = 2
//
// Output:
// 4
//
// Explanation:
// Replace the two 'A's with two 'B's or vice versa.
//
//
// Example 2:
//
// Input:
// s = "AABABBA", k = 1
//
// Output:
// 4
//
// Explanation:
// Replace the one 'A' in the middle with 'B' and form "AABBBBA".
// The substring "BBBB" has the longest repeating letters, which is 4.
//

class Solution {
    public int characterReplacement(String s, int k) {
        if (s.isEmpty()) return 0;

        HashMap<Character, Integer> chars = new HashMap<>();
        char c;
        int cnt;
        int maxFreq = 0;
        int result = 0;
        int l = 0;

        for (int r = 0; r < s.length(); r++) {
            c = s.charAt(r);
            cnt = chars.getOrDefault(c, 0);
            chars.put(c, ++cnt);
            if (cnt > maxFreq) maxFreq = cnt;

            while (r - l + 1 - maxFreq > k) {
                c = s.charAt(l++);
                cnt = chars.get(c);
                chars.put(c, cnt - 1);
                maxFreq = Collections.max(chars.values());
            }

            result = Math.max(result, r - l + 1);
        }

        return result;
    }
}
