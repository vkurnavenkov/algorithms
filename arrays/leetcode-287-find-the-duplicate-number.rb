# Leetcode 287. Find the Duplicate Number
#
# Given an array nums containing n + 1 integers where each integer is between 1 and n (inclusive), prove that at least one duplicate number must exist. Assume that there is only one duplicate number, find the duplicate one.
#
# Example 1:
#
# Input: [1,3,4,2,2]
# Output: 2
# Example 2:
#
# Input: [3,1,3,4,2]
# Output: 3
# Note:
#
# You must not modify the array (assume the array is read only).
# You must use only constant, O(1) extra space.
# Your runtime complexity should be less than O(n2).
# There is only one duplicate number in the array, but it could be repeated more than once.
#

# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
    slow = nums[0]
    fast = nums[0]
    begin
        slow = nums[slow]
        fast = nums[nums[fast]]
    end while slow != fast

    ptr1 = nums[0]
    ptr2 = slow
    while ptr1 != ptr2
        ptr1 = nums[ptr1]
        ptr2 = nums[ptr2]
    end

    return ptr1
end
