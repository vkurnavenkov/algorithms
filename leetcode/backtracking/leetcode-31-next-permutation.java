// Leetcode 31. Next Permutation
//
// Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
//
// If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
//
// The replacement must be in-place and use only constant extra memory.
//
// Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
//
// 1,2,3 → 1,3,2
// 3,2,1 → 1,2,3
// 1,1,5 → 1,5,1
//

class Solution {
    public void nextPermutation(int[] nums) {
        int pos = nums.length - 2;
        while (pos >= 0 && nums[pos] >= nums[pos + 1]) pos--;

        if (pos >= 0) {
            int idx = pos + 2;
            while (idx < nums.length && nums[idx] > nums[pos]) idx++;

            swap(nums, pos, idx - 1);
        }

        reverse(nums, pos + 1);
    }

    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    private void reverse(int[] nums, int start) {
        int n = (nums.length - start) / 2;
        for (int i = 0; i < n; i++) swap(nums, i + start, nums.length - 1 - i);
    }
}
