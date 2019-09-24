# Leetcode 159. Longest Substring with At Most Two Distinct Characters
#
# Given a string s , find the length of the longest substring t  that contains at most 2 distinct characters.
#
# Example 1:
#
# Input: "eceba"
# Output: 3
# Explanation: t is "ece" which its length is 3.
# Example 2:
#
# Input: "ccaabbb"
# Output: 5
# Explanation: t is "aabbb" which its length is 5.
#

# @param {String} s
# @return {Integer}
def length_of_longest_substring_two_distinct(s)
    k = 2
    return s.length if s.length <= k

    result = 0
    l = 0
    r = 0
    chars = {}

    while r < s.length
        if chars.size <= k
            c = s[r]
            chars[c] = r
            r += 1
        end

        if chars.size > k
            i = chars.values.min
            c = s[i]
            l = chars[c] + 1
            chars.delete(c)
        end

        result = [result, r - l].max
    end

    result
end
