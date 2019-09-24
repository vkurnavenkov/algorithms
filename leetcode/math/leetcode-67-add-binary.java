// LeetCode 67. Add Binary
// https://leetcode.com/problems/add-binary/
//
// Given two binary strings, return their sum (also a binary string).
//
// The input strings are both non-empty and contains only characters 1 or 0.
//
// Example 1:
//
// Input: a = "11", b = "1"
// Output: "100"
// Example 2:
//
// Input: a = "1010", b = "1011"
// Output: "10101"
//

class Solution {
    public String addBinary(String a, String b) {
        int p1 = a.length() - 1, p2 = b.length() - 1;
        int carry = 0;
        StringBuilder sb = new StringBuilder();

        while (p1 >= 0 || p2 >= 0) {
            int v1 = p1 >= 0 ? a.charAt(p1--) - '0' : 0;
            int v2 = p2 >= 0 ? b.charAt(p2--) - '0' : 0;
            int val = v1 + v2 + carry;
            sb.append(Integer.toString(val % 2));
            carry = val / 2;
        }
        if (carry == 1) sb.append("1");

        return sb.reverse().toString();
    }
}
