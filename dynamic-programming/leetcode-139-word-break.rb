# Leetcode 139. Word Break
#
# Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
#
# Note:
#
# The same word in the dictionary may be reused multiple times in the segmentation.
# You may assume the dictionary does not contain duplicate words.
# Example 1:
#
# Input: s = "leetcode", wordDict = ["leet", "code"]
# Output: true
# Explanation: Return true because "leetcode" can be segmented as "leet code".
# Example 2:
#
# Input: s = "applepenapple", wordDict = ["apple", "pen"]
# Output: true
# Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
#              Note that you are allowed to reuse a dictionary word.
# Example 3:
#
# Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
# Output: false
#

# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
    word_break_helper(s, Set.new(word_dict), 0, Array.new(s.length))
end

def word_break_helper(s, dict, start, dp)
    return true if s.length == start

    return dp[start] if dp[start] != nil

    (start...s.length).each do |i|
        if dict.include?(s[start..i]) && word_break_helper(s, dict, i + 1, dp)
            return dp[start] = true
        end
    end
    dp[start] = false
end
