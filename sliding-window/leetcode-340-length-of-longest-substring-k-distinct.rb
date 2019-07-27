# Leetcode 340. Longest Substring with At Most K Distinct Characters
#
# Given a string, find the length of the longest substring T that contains at most k distinct characters.
#
# Example 1:
#
# Input: s = "eceba", k = 2
# Output: 3
# Explanation: T is "ece" which its length is 3.
# Example 2:
#
# Input: s = "aa", k = 1
# Output: 2
# Explanation: T is "aa" which its length is 2.
#

# @param {String} s
# @param {Integer} k
# @return {Integer}
def length_of_longest_substring_k_distinct(s, k)
    return 0 if s.empty? || k == 0

    counts = Hash.new {0}
    count = 0
    r = 0
    l = 0
    result = 1
    while r < s.length
        c = s[r]
        count += 1 if counts[c] == 0
        counts[c] += 1

        while count > k
            counts[s[l]] -= 1
            count -= 1 if counts[s[l]] == 0
            l += 1
        end

        result = [result, r - l + 1].max
        r += 1
    end

    result
end
