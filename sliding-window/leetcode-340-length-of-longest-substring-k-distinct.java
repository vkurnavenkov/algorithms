// Leetcode 340. Longest Substring with At Most K Distinct Characters
//
// Given a string, find the length of the longest substring T that contains at most k distinct characters.
//
// Example 1:
//
// Input: s = "eceba", k = 2
// Output: 3
// Explanation: T is "ece" which its length is 3.
// Example 2:
//
// Input: s = "aa", k = 1
// Output: 2
// Explanation: T is "aa" which its length is 2.
//

class Solution {
    public int lengthOfLongestSubstringKDistinct(String s, int k) {
        if (s.length() == 0 || k ==0) return 0;

        int result = 0;
        HashMap<Character, Integer> counts = new HashMap<>();
        int count = 0;
        int l = 0;
        int cnt;
        Character c;

        for (int r = 0; r < s.length(); r++) {
            c = s.charAt(r);
            cnt = counts.containsKey(c) ? counts.get(c) : 0;
            if (cnt == 0) count++;
            counts.put(c, cnt + 1);

            while (count > k) {
                cnt = counts.get(s.charAt(l));
                cnt--;
                counts.put(s.charAt(l++), cnt);
                if (cnt == 0) count--;
            }
            result = Math.max(result, r - l + 1);
        }

        return result;
    }
}
