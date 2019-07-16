// Leetcode 22. Generate Parentheses
//
// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
// For example, given n = 3, a solution set is:
//
// [
//   "((()))",
//   "(()())",
//   "(())()",
//   "()(())",
//   "()()()"
// ]
//

class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> results = new ArrayList();
        backtrack("", 0, 0, results, n);

        return results;
    }

    private void backtrack(String current, int open, int close, List<String> results, int max) {
        if (current.length() == 2 * max) {
            results.add(current);
            return;
        }

        if (open < max) {
            backtrack(current + "(", open + 1, close, results, max);
        }

        if (close < open) {
            backtrack(current + ")", open, close + 1, results, max);
        }
    }
}
