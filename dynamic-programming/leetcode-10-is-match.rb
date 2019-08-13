# Leetcode 10. Regular Expression Matching
#
# Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
#
# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.
# The matching should cover the entire input string (not partial).
#
# Note:
#
# s could be empty and contains only lowercase letters a-z.
# p could be empty and contains only lowercase letters a-z, and characters like . or *.
# Example 1:
#
# Input:
# s = "aa"
# p = "a"
# Output: false
# Explanation: "a" does not match the entire string "aa".
# Example 2:
#
# Input:
# s = "aa"
# p = "a*"
# Output: true
# Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
# Example 3:
#
# Input:
# s = "ab"
# p = ".*"
# Output: true
# Explanation: ".*" means "zero or more (*) of any character (.)".
# Example 4:
#
# Input:
# s = "aab"
# p = "c*a*b"
# Output: true
# Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
# Example 5:
#
# Input:
# s = "mississippi"
# p = "mis*is*p*."
# Output: false
#

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    dp = Array.new(s.length + 1) { Array.new(p.length + 1, false) }
    dp[0][0] = true

    (1...dp[0].size).each do |j|
        if p[j - 1] == '*'
            dp[0][j] = dp[0][j - 2]
        end
    end

    (1...dp.size).each do |i|
        (1...dp[0].size).each do |j|
            if s[i - 1] == p[j - 1] || p[j - 1] == '.'
                dp[i][j] = dp[i - 1][j - 1]
            elsif p[j - 1] == '*'
                if s[i - 1] == p[j - 2] || p[j - 2] == '.'
                    dp[i][j] = dp[i - 1][j] || dp[i][j - 2]
                else
                    dp[i][j] = dp[i][j - 2]
                end
            else
                dp[i][j] = false
            end
        end
    end

    dp[s.length][p.length]
end
