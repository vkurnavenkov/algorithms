// LeetCode 15. 3Sum
//
// Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
// Note:
//
// The solution set must not contain duplicate triplets.
//
// Example:
//
// Given array nums = [-1, 0, 1, 2, -1, -4],
//
// A solution set is:
// [
//   [-1, 0, 1],
//   [-1, -1, 2]
// ]
//

// Solution 1. Returns duplicates! (not accepted).
// Runtime complexity: O(n^2)
// Space complexity: O(n)
//
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> list = new ArrayList<>();
        for (int i = 0; i < nums.length - 1; i++) {
            Set<Integer> set = new HashSet<>();
            for (int j = i + 1; j < nums.length; j++) {
                int sum = -(nums[i] + nums[j]);
                if (set.contains(sum)) {
                    list.add(Arrays.asList(new Integer[] {nums[i], sum, nums[j]}));
                } else {
                    set.add(nums[j]);
                }
            }
        }
        return list;
    }
}

// Solution 2.
// Runtime complexity: O(n^2)
// Space complexity: O(1)
//
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        List<List<Integer>> list = new ArrayList<>();
        for (int i = 0; i < nums.length - 1; i++) {
            if (i > 0 && nums[i] == nums[i - 1]) continue;

            int l = i + 1;
            int r = nums.length - 1;
            while (l < r) {
                int sum = nums[i] + nums[l] + nums[r];
                if (sum == 0) {
                    list.add(Arrays.asList(nums[i], nums[l], nums[r]));
                    while (l < r && nums[l] == nums[l + 1]) l++;
                    while (l < r && nums[r] == nums[r - 1]) r--;
                    l++;
                    r--;
                }
                else if (sum < 0) l++;
                else r--;
            }
        }
        return list;
    }
}
