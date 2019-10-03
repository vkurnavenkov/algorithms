# LeetCode 91. Decode Ways
# https://leetcode.com/problems/decode-ways/
#
# A message containing letters from A-Z is being encoded to numbers using the following mapping:
#
# 'A' -> 1
# 'B' -> 2
# ...
# 'Z' -> 26
# Given a non-empty string containing only digits, determine the total number of ways to decode it.
#
# Example 1:
#
# Input: "12"
# Output: 2
# Explanation: It could be decoded as "AB" (1 2) or "L" (12).
# Example 2:
#
# Input: "226"
# Output: 3
# Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
#

# @param {String} s
# @return {Integer}
def num_decodings(s)
    return 0 if s.empty? || s[0] == '0'

    prev = s[0].ord - '0'.ord
    dp1 = 1
    dp2 = 1

    (1...s.length).each do |i|
        dp = 0
        cur = s[i].ord - '0'.ord
        dp += dp1 if cur > 0
        two = prev * 10 + cur
        if prev > 0
            dp += dp2 if two > 0 && two <= 26
        end

        prev = cur
        dp2 = dp1
        dp1 = dp
    end
    dp1
end
