# LeetCode 17. Letter Combinations of a Phone Number
# https://leetcode.com/problems/letter-combinations-of-a-phone-number/
#
# Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
#
# A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
#
# Example:
#
# Input: "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
#

class Solution
    BUTTONS = {
        '2' => ['a', 'b', 'c'],
        '3' => ['d', 'e', 'f'],
        '4' => ['g', 'h', 'i'],
        '5' => ['j', 'k', 'l'],
        '6' => ['m', 'n', 'o'],
        '7' => ['p', 'q', 'r', 's'],
        '8' => ['t', 'u', 'v'],
        '9' => ['w', 'x', 'y', 'z'],
    }
    def solve(digits)
        results = []
        return results if digits.empty?

        backtrack(digits, 0, Array.new(digits.length), results)
        results
    end

    private

    def backtrack(digits, idx, current, results)
        if idx == digits.size
            results.push(current.join)
            return
        end

        digit = digits[idx]
        BUTTONS[digit].each do |char|
            current[idx] = char
            backtrack(digits, idx + 1, current, results)
        end
    end
end

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    Solution.new.solve(digits)
end
