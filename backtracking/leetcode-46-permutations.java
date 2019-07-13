// Leetcode 46. Permutations.
//
// Given a collection of distinct integers, return all possible permutations.
//
// Example:
//
// Input: [1,2,3]
// Output:
// [
//   [1,2,3],
//   [1,3,2],
//   [2,1,3],
//   [2,3,1],
//   [3,1,2],
//   [3,2,1]
// ]
//

class Solution {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> results = new ArrayList<List<Integer>>();
        doPermute(nums, 0, results);

        return results;
    }

    private void doPermute(int[] nums, int start, List<List<Integer>> results) {
        if (start == nums.length) {
            List<Integer> list = new ArrayList<Integer>();
            for (int val : nums) {
                list.add(val);
            }
            results.add(list);
            return;
        }

        for (int i = start; i < nums.length; i++) {
            swap(nums, start, i);
            doPermute(nums, start + 1, results);
            swap(nums, start, i);
        }
    }

    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
