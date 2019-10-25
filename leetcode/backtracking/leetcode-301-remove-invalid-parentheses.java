// LeetCode 301. Remove Invalid Parentheses
// https://leetcode.com/problems/remove-invalid-parentheses/
//
// Remove the minimum number of invalid parentheses in order to make the input string valid. Return all possible results.
//
// Note: The input string may contain letters other than the parentheses ( and ).
//
// Example 1:
//
// Input: "()())()"
// Output: ["()()()", "(())()"]
// Example 2:
//
// Input: "(a)())()"
// Output: ["(a)()()", "(a())()"]
// Example 3:
//
// Input: ")("
// Output: [""]
//

class Solution {
    public List<String> removeInvalidParentheses(String s) {
        Set<String> set = new HashSet();
        int left = 0;
        int right = 0;
        for (char c: s.toCharArray()) {
          if (c == '(') {
            left++;
          } else if (c == ')') {
            if (left == 0) {
              right++;
            } else {
              left--;
            }
          }
        }

        StringBuilder sb = new StringBuilder();
        backtrack(s, 0, 0, 0, left, right, sb, set);
        return new ArrayList(set);
    }

    private void backtrack(String s, int pos, int curLeft, int curRight, int left, int right, StringBuilder cur, Set<String> set) {
        if (curLeft < curRight || left < 0 || right < 0) return;

        if (pos == s.length()) {
          if (left == 0 && right == 0) set.add(cur.toString());
          return;
        }

        char c = s.charAt(pos);

        cur.append(c);
        int dLeft = c == '(' ? 1 : 0;
        int dRight = c == ')' ? 1 : 0;
        backtrack(s, pos + 1, curLeft + dLeft, curRight + dRight, left, right, cur, set);
        cur.deleteCharAt(cur.length() - 1);

        if (c == '(' || c == ')') {
          backtrack(s, pos + 1, curLeft, curRight, left - dLeft, right - dRight, cur, set);
        }
    }
}
