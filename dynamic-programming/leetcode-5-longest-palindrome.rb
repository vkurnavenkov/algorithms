# Leetcode 5. Longest Palindromic Substring
#
# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
#
# Example 1:
#
# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:
#
# Input: "cbbd"
# Output: "bb"
#

# @param {String} s
# @return {String}
def longest_palindrome(s)
    return "" if s.empty?

    left = 0
    right = 0

    s.length.times do |i|
        d = 1
        while i - d >= 0 && i + d < s.length && s[i - d] == s[i + d]
            d += 1
        end
        if (d - 1) * 2 + 1 > right - left + 1
            left = i - d + 1
            right = i + d - 1
        end

        if i + 1 < s.length && s[i] == s[i + 1]
            d = 1
            while i - d >= 0 && i + d + 1 < s.length && s[i - d] == s[i + d + 1]
                d += 1
            end
            if d * 2 > right - left + 1
                left = i - d + 1
                right = i + d
            end
        end
    end

    s[left..right]
end
