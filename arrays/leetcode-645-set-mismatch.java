// Leetcode 645. Set Mismatch
//
// The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, which results in repetition of one number and loss of another number.
//
// Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is missing. Return them in the form of an array.
//
// Example 1:
// Input: nums = [1,2,2,4]
// Output: [2,3]
// Note:
// The given array size will in the range [2, 10000].
// The given array's numbers won't have any order.
//

// Solution 1.
// Runtime complexity: O(n)
// Space complexity: O(1) - original array modification

class Solution {
    public int[] findErrorNums(int[] nums) {
        int dup = -1, lost = 1;
        int idx;
        for (int i = 0; i < nums.length; i++) {
            idx = Math.abs(nums[i]) - 1;
            if (nums[idx] < 0)
                dup = Math.abs(nums[i]);
            else
                nums[idx] = -nums[idx];
        }

        for (int i = 0; i < nums.length; i++) {
            if (nums[i] > 0) lost = i + 1;
        }

        return new int[]{dup, lost};
    }
}
