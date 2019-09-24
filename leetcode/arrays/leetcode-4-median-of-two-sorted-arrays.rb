# LeetCode 4. Median of Two Sorted Arrays
# https://leetcode.com/problems/median-of-two-sorted-arrays/
#
# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
#
# You may assume nums1 and nums2 cannot be both empty.
#
# Example 1:
#
# nums1 = [1, 3]
# nums2 = [2]
#
# The median is 2.0
# Example 2:
#
# nums1 = [1, 2]
# nums2 = [3, 4]
#
# The median is (2 + 3)/2 = 2.5
#

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    if nums1.size > nums2.size
        nums1, nums2 = nums2, nums1
    end

    min_value = -1.0 / 0
    max_value = 1.0 / 0
    l = 0
    r = nums1.size
    while l <= r
        part1 = (l + r) / 2
        part2 = (nums1.size + nums2.size + 1) / 2 - part1
        left1 = part1 > 0 ? nums1[part1 - 1] : min_value
        right1 = part1 < nums1.size ? nums1[part1] : max_value
        left2 = part2 > 0 ? nums2[part2 - 1] : min_value
        right2 = part2 < nums2.size ? nums2[part2] : max_value
        if left1 <= right2 && left2 <= right1
            return (nums1.size + nums2.size) % 2 == 1 ?
                [left1, left2].max.to_f : ([left1, left2].max + [right1, right2].min) / 2.0
        elsif left1 > right2
            r = part1 -1
        else
            l = part1 + 1
        end
    end
end
