// LeetCode 33. Search in Rotated Sorted Array
// https://leetcode.com/problems/search-in-rotated-sorted-array/
//
// Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
//
// (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
//
// You are given a target value to search. If found in the array return its index, otherwise return -1.
//
// You may assume no duplicate exists in the array.
//
// Your algorithm's runtime complexity must be in the order of O(log n).
//
// Example 1:
//
// Input: nums = [4,5,6,7,0,1,2], target = 0
// Output: 4
// Example 2:
//
// Input: nums = [4,5,6,7,0,1,2], target = 3
// Output: -1
//

class Solution {
    int[] nums;

    public int search(int[] nums, int target) {
        this.nums = nums;
        return bsearch(target, 0, nums.length - 1);
    }

    private int bsearch(int target, int l, int r) {
        if (l > r) return -1;

        int mid = (r + l) / 2;
        if (target == nums[mid]) return mid;

        if (nums[l] <= nums[mid]) {
            if (nums[l] <= target && target < nums[mid]) {
                return bsearch(target, l, mid - 1);
            } else {
                return bsearch(target, mid + 1, r);
            }
        } else {
            if (nums[mid] < target && target < nums[l]) {
                return bsearch(target, mid + 1, r);
            } else {
                return bsearch(target, l, mid - 1);
            }
        }
    }
}
