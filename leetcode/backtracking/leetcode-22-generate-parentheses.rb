# Leetcode 22. Generate Parentheses
#
# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
#
# For example, given n = 3, a solution set is:
#
# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]
#

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    results = []
    backtrack("", 0, 0, results, n)

    results
end

def backtrack(current, open, close, results, max)
    if current.length == max * 2
        results.push(current)
        return
    end

    if open < max
        backtrack(current + "(", open + 1, close, results, max)
    end

    if close < open
        backtrack(current + ")", open, close + 1, results, max)
    end
end
