// LeetCode 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/
//
// There are two sorted arrays nums1 and nums2 of size m and n respectively.
//
// Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
//
// You may assume nums1 and nums2 cannot be both empty.
//
// Example 1:
//
// nums1 = [1, 3]
// nums2 = [2]
//
// The median is 2.0
// Example 2:
//
// nums1 = [1, 2]
// nums2 = [3, 4]
//
// The median is (2 + 3)/2 = 2.5
//

class Solution {
    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        if (nums1.length > nums2.length) {
            int[] tmp = nums1;
            nums1 = nums2;
            nums2 = tmp;
        }
        int l = 0;
        int r = nums1.length;
        while (l <= r) {
            int partA = (l + r) / 2;
            int partB = (nums1.length + nums2.length + 1) / 2 - partA;
            int left1 = partA > 0 ? nums1[partA - 1] : Integer.MIN_VALUE;
            int right1 = partA < nums1.length ? nums1[partA] : Integer.MAX_VALUE;
            int left2 = partB > 0 ? nums2[partB - 1] : Integer.MIN_VALUE;
            int right2 = partB < nums2.length ? nums2[partB] : Integer.MAX_VALUE;
            if (left1 <= right2 && left2 <= right1) {
                int len = nums1.length + nums2.length;
                return len % 2 == 1 ?
                    Math.max(left1, left2) :
                    (Math.max(left1, left2) + Math.min(right1, right2)) / 2.0;
            } else if (left1 > right2) {
                r = partA - 1;
            } else {
                l = partA + 1;
            }
        }
        return 0;
    }
}
