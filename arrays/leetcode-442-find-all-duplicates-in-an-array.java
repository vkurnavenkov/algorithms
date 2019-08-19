// Leetcode 442. Find All Duplicates in an Array
//
// Given an array of integers, 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
//
// Find all the elements that appear twice in this array.
//
// Could you do it without extra space and in O(n) runtime?
//
// Example:
// Input:
// [4,3,2,7,8,2,3,1]
//
// Output:
// [2,3]
//

class Solution {
    public List<Integer> findDuplicates(int[] nums) {
        List<Integer> solution = new ArrayList();
        for (int i = 0; i < nums.length; i++) {
            int idx = Math.abs(nums[i]);
            if (nums[idx - 1] > 0) {
                nums[idx - 1] = -nums[idx - 1];
            } else {
                solution.add(idx);
            }
        }
        return solution;
    }
}
