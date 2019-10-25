# LeetCode 349. Intersection of Two Arrays
# https://leetcode.com/problems/intersection-of-two-arrays/
#
# Given two arrays, write a function to compute their intersection.
#
# Example 1:
#
# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2]
# Example 2:
#
# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [9,4]
# Note:
#
# Each element in the result must be unique.
# The result can be in any order.
#

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
    set1 = Set.new
    nums1.each do |v|
        set1.add(v)
    end

    set2 = Set.new
    result = []
    nums2.each do |v|
        if set1.include?(v) && !set2.include?(v)
            result.push(v)
        end
        set2.add(v)
    end
    result
end
