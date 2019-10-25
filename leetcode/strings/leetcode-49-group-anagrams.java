// LeetCode 49. Group Anagrams
// https://leetcode.com/problems/group-anagrams/
//
// Given an array of strings, group anagrams together.
//
// Example:
//
// Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
// Output:
// [
//   ["ate","eat","tea"],
//   ["nat","tan"],
//   ["bat"]
// ]
// Note:
//
// All inputs will be in lowercase.
// The order of your output does not matter.
//

// Solution 1.
// Runtime complexity: NKlogK
// Space Complexity: O(NK) (size of result)
//
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs.length == 0) return new ArrayList();

        Map<String, List> map = new HashMap();
        for (String s: strs) {
            char[] chars = s.toCharArray();
            Arrays.sort(chars);
            String key = new String(chars);
            if (!map.containsKey(key)) {
                map.put(key, new ArrayList());
            }
            map.get(key).add(s);
        }

        return new ArrayList(map.values());
    }
}

// Solution 1.
// Runtime complexity: NK
// Space Complexity: O(NK) (size of result)
//
class Solution {
    public List<List<String>> groupAnagrams(String[] strs) {
        if (strs.length == 0) return new ArrayList();

        Map<String, List> map = new HashMap();
        int[] counts = new int[26];
        for (String s: strs) {
            Arrays.fill(counts, 0);
            for (char c: s.toCharArray()) counts[c - 'a']++;

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 26; i++) {
                sb.append('#');
                sb.append(counts[i]);
            }
            String key = sb.toString();
            if (!map.containsKey(key)) {
                map.put(key, new ArrayList());
            }
            map.get(key).add(s);
        }

        return new ArrayList(map.values());
    }
}
