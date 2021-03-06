// LeetCode 29. Divide Two Integers
// https://leetcode.com/problems/divide-two-integers/
//
// Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
//
// Return the quotient after dividing dividend by divisor.
//
// The integer division should truncate toward zero.
//
// Example 1:
//
// Input: dividend = 10, divisor = 3
// Output: 3
// Example 2:
//
// Input: dividend = 7, divisor = -3
// Output: -2
// Note:
//
// Both dividend and divisor will be 32-bit signed integers.
// The divisor will never be 0.
// Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1].
// For the purpose of this problem, assume that your function returns 2^31 − 1 when the division result overflows.
//

class Solution {
    public int divide(int dividend, int divisor) {
        int result = 0;
        if (dividend == Integer.MIN_VALUE) {
            if (divisor == -1) return Integer.MAX_VALUE;
            if (divisor == Integer.MIN_VALUE) return 1;
            if (divisor < 0) {
                dividend -= divisor;
            } else {
                dividend += divisor;
            }
            result = 1;
        }
        if (divisor == Integer.MIN_VALUE) return 0;
        boolean sign = (dividend ^ divisor) >= 0;
        dividend = Math.abs(dividend);
        divisor = Math.abs(divisor);
        int coef = 1;
        int sum = divisor;
        while (dividend >= divisor) {
            result += coef;
            dividend -= sum;
            sum <<= 1;
            coef <<= 1;
            if (sum > dividend) {
                coef = 1;
                sum = divisor;
            }
        }
        return sign ? result : -result;
    }
}
