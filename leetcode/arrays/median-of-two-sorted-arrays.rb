# Leetcode 4. Median of Two Sorted Arrays
#
# There are two sorted arrays nums1 and nums2 of size m and n respectively.
#
# Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
#
# Example 1:
# nums1 = [1, 3]
# nums2 = [2]
#
# The median is 2.0
# Example 2:
# nums1 = [1, 2]
# nums2 = [3, 4]
#
# The median is (2 + 3)/2 = 2.5
#

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    return find_median_sorted_arrays(nums2, nums1) if nums1.size > nums2.size
    max_value = 1.fdiv(0)
    min_value = -max_value
    x = nums1.size
    y = nums2.size
    low = 0
    high = x
    while low <= high
        x_partition = (low + high) / 2
        y_partition = (x + y + 1) / 2 - x_partition

        x_max = x_partition == 0 ? min_value : nums1[x_partition - 1]
        x_min = x_partition == x ? max_value : nums1[x_partition]

        y_max = y_partition == 0 ? min_value : nums2[y_partition - 1]
        y_min = y_partition == y ? max_value : nums2[y_partition]

        if x_max <= y_min && y_max <= x_min
            if (x + y) % 2 == 0
                return ([x_max, y_max].max + [x_min, y_min].min) / 2.0
            else
                return [x_max, y_max].max
            end
        elsif x_max > y_min
            high = x_partition - 1
        else
            low = x_partition + 1
        end
    end
    return nil
end

### The second implementation

MAX_INT = 1.fdiv(0)
MIN_INT = -MAX_INT

def find_median_sorted_arrays2(nums1, nums2)
    size1 = nums1.size
    size2 = nums2.size
    return find_median_sorted_arrays2(nums2, nums1) if size1 > size2
    l = 0
    r = size1
    size_avg = (size1 + size2) / 2
    while l <= r
        mid1 = (l + r) / 2
        mid2 = size_avg - mid1
    
        left_max1 = mid1 == 0 ? MIN_INT : nums1[mid1 - 1]
        left_max2 = mid2 == 0 ? MIN_INT : nums2[mid2 - 1]

        right_min1 = mid1 == size1 ? MAX_INT : nums1[mid1]
        right_min2 = mid2 == size2 ? MAX_INT : nums2[mid2]

        if left_max1 <= right_min2 && left_max2 <= right_min1
            if (size1 + size2).even?
                return ([left_max1, left_max2].max + [right_min1, right_min2].min) / 2.0
            else
                return [right_min1, right_min2].min
            end
        elsif left_max1 > right_min2
            r = mid1 - 1
        else
            l = mid1 + 1
        end
    end

    return nil
end
