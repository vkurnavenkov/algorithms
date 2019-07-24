# Leetcode 3. Longest Substring Without Repeating Characters
#
# Given a string, find the length of the longest substring without repeating characters.
#
# Example 1:
#
# Input: "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.
# Example 2:
#
# Input: "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.
# Example 3:
#
# Input: "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
#              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
#

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  left = 0
  right = 0
  chars = {}
  result = 0

  while right < s.length
    c = s[right]
    if chars.key?(c)
      left = [chars[c] + 1, left].max
    end
    result = [result, right - left + 1].max
    chars[c] = right
    right += 1
  end

  result
end

puts length_of_longest_substring("abcabcbb") # 3
puts length_of_longest_substring("bbbb") # 1
puts length_of_longest_substring("pwwkew") # 3
puts length_of_longest_substring("abcabcbbabcde") # 5
puts length_of_longest_substring("") # 0
puts length_of_longest_substring("a") # 1
puts length_of_longest_substring("ab") # 2
