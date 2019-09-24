# Leetcode 14. Longest Common Prefix
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#
# Input: ["flower","flow","flight"]
# Output: "fl"
# Example 2:
#
# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
# Note:
#
# All given inputs are in lowercase letters a-z.
#

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return "" if strs.empty?

    min_len = strs[0].length
    (1...strs.size).each do |i|
        min_len = strs[i].length if strs[i].length < min_len
    end

    prefix = ""
    len = 1
    while len <= min_len
        cur_prefix = strs[0][0..len - 1]
        (1...strs.size).each do |i|
            return prefix if strs[i][0..len - 1] != cur_prefix
        end
        len += 1
        prefix = cur_prefix
    end

    prefix
end
