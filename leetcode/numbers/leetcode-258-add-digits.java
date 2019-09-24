// Leetcode 258. Add Digits
//
// Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
//
// Example:
//
// Input: 38
// Output: 2
// Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
//              Since 2 has only one digit, return it.
//

// Solution 1
class Solution {
    public int addDigits(int num) {
        while (num >= 10) {
            int sum = 0;
            while (num > 0) {
                int d = num % 10;
                num /= 10;
                sum += d;
            }
            num = sum;
        }
        return num;
    }
}

// Solution 2
// Runtime: O(1)
class Solution {
    public int addDigits(int num) {
        return (num - 1) % 9 + 1;
   }
}
