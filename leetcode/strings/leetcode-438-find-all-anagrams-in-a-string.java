// LeetCode 438. Find All Anagrams in a String
// https://leetcode.com/problems/find-all-anagrams-in-a-string/
//
// Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.
//
// Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.
//
// The order of output does not matter.
//
// Example 1:
//
// Input:
// s: "cbaebabacd" p: "abc"
//
// Output:
// [0, 6]
//
// Explanation:
// The substring with start index = 0 is "cba", which is an anagram of "abc".
// The substring with start index = 6 is "bac", which is an anagram of "abc".
// Example 2:
//
// Input:
// s: "abab" p: "ab"
//
// Output:
// [0, 1, 2]
//
// Explanation:
// The substring with start index = 0 is "ab", which is an anagram of "ab".
// The substring with start index = 1 is "ba", which is an anagram of "ab".
// The substring with start index = 2 is "ab", which is an anagram of "ab".
//

// Solution 1.
// Array
//
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        int[] chars = new int[26];
        for (int i = 0; i < p.length(); i++) chars[p.charAt(i) - 'a']++;

        List<Integer> list = new LinkedList();
        int count = p.length();
        for (int i = 0; i < s.length(); i++) {
            int c = s.charAt(i) - 'a';
            chars[c]--;
            if (chars[c] >= 0) count--;

            if (i >= p.length()) {
                int c2 = s.charAt(i - p.length()) - 'a';
                chars[c2]++;
                if (chars[c2] > 0) count++;
            }

            if (count == 0) list.add(i - p.length() + 1);
        }

        return list;
    }
}

// Solution 2.
// HashMap
//
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
        Map<Character, Integer> map = new HashMap();
        for (int i = 0; i < p.length(); i++) {
            char c = p.charAt(i);
            int val = map.getOrDefault(c, 0);
            map.put(c, val + 1);
        }

        List<Integer> list = new LinkedList();
        int count = p.length();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            map.put(c, map.getOrDefault(c, 0) - 1);
            if (map.get(c) >= 0) count--;

            if (i >= p.length()) {
                char c2 = s.charAt(i - p.length());
                map.put(c2, map.getOrDefault(c2, 0) + 1);
                if (map.get(c2) > 0) count++;
            }

            if (count == 0) list.add(i - p.length() + 1);
        }

        return list;
    }
}
