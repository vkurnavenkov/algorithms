# LeetCode 301. Remove Invalid Parentheses
# https://leetcode.com/problems/remove-invalid-parentheses/
#
# Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
#
# Note: The input string may contain letters other than the parentheses ( and ).
#
# Example 1:
#
# Input: "()())()"
# Output: ["()()()", "(())()"]
# Example 2:
#
# Input: "(a)())()"
# Output: ["(a)()()", "(a())()"]
# Example 3:
#
# Input: ")("
# Output: [""]
#

class Solution
    def remove_invalid_parentheses(s)
        results = Set.new
        right = 0
        left = 0
        s.chars.each do |c|
            if c == '('
                left += 1
            elsif c == ')'
                if left == 0
                    right += 1
                else
                    left -= 1
                end
            end
        end

        backtrack(s, 0, 0, 0, left, right, '', results)
        results.to_a
    end

    private

    def backtrack(s, pos, left_count, right_count, left_extra, right_extra, cur, results)
        return if left_count < right_count || left_extra < 0 || right_extra < 0

        if pos == s.length
            results.add(cur) if left_extra == 0 && right_extra == 0
            return
        end

        if s[pos] != '(' && s[pos] != ')'
            backtrack(s, pos + 1, left_count, right_count, left_extra, right_extra, cur + s[pos], results)
            return
        end

        if s[pos] == '('
            backtrack(s, pos + 1, left_count, right_count, left_extra - 1, right_extra, cur, results)
            backtrack(s, pos + 1, left_count + 1, right_count, left_extra, right_extra, cur + s[pos], results)
        else
            backtrack(s, pos + 1, left_count, right_count, left_extra, right_extra - 1, cur, results)
            backtrack(s, pos + 1, left_count, right_count + 1, left_extra, right_extra, cur + s[pos], results)
        end
    end
end

# @param {String} s
# @return {String[]}
def remove_invalid_parentheses(s)
    Solution.new.remove_invalid_parentheses(s)
end
