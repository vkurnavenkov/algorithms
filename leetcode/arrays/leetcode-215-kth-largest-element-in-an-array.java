// LeetCode 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/
//
// Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
//
// Example 1:
//
// Input: [3,2,1,5,6,4] and k = 2
// Output: 5
// Example 2:
//
// Input: [3,2,3,1,2,4,5,5,6] and k = 4
// Output: 4
// Note:
// You may assume k is always valid, 1 ≤ k ≤ array's length.
//

class Solution {
    public int findKthLargest(int[] nums, int k) {
        int l = 0;
        int r = nums.length - 1;
        while (l <= r) {
            int mid = partition(nums, l, r);
            if (mid + 1 == k) return nums[mid];

            if (mid + 1 > k) {
                r = mid - 1;
            } else {
                l = mid + 1;
            }
        }
        return -1;
    }

    private int partition(int[] nums, int l, int r) {
        Random random = new Random();
        int i = random.nextInt(r - l + 1);
        int pivot = nums[l + i];
        swap(nums, l + i, r);
        i = l;

        while (i <= r) {
            if (nums[i] > pivot) {
                swap(nums, i, l);
                l++;
            }
            i++;
        }

        swap(nums, r, l);

        return l;
    }

    private int partition3(int[] nums, int l, int r) {
        Random random = new Random();
        int i = random.nextInt(r - l + 1);
        swap(nums, l, l + i);
        int pivot = nums[l];
        i = l + 1;

        while (i <= r) {
            if (nums[i] > pivot) {
                swap(nums, i, l);
                l++;
                i++;
            } else if (nums[i] < pivot) {
                swap(nums, i, r);
                r--;
            } else {
                i++;
            }
        }

        return r;
    }

    private void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }
}
