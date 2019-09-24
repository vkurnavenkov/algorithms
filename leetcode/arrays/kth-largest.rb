# Leetcode 215. Kth Largest Element in an Array
# Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
#
# Example 1:
#
# Input: [3,2,1,5,6,4] and k = 2
# Output: 5
#
# Example 2:
#
# Input: [3,2,3,1,2,4,5,5,6] and k = 4
# Output: 4
# Note:
# You may assume k is always valid, 1 ≤ k ≤ array's length.
#

def partition(nums, left, right)
    l_idx = left
    (l_idx..right).each do |idx|
        if nums[idx] > nums[left]
            l_idx += 1
            nums[l_idx], nums[idx] = nums[idx], nums[l_idx]
        end
    end
    nums[l_idx], nums[left] = nums[left], nums[l_idx]
    l_idx
end

def quick_select(nums, left, right, k)
    return nil if left > right
    return nums[left] if left == right
    pivot = rand(left..right)
    nums[pivot], nums[left] = nums[left], nums[pivot]
    idx = partition(nums, left, right)
    return nums[idx] if idx + 1 == k
    k < idx + 1 ? quick_select(nums, left, idx - 1, k) : quick_select(nums, idx + 1, right, k)
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
    quick_select(nums, 0, nums.size - 1, k)
end

# puts find_kth_largest([3,2,1,5,6,4], 2) # 5
puts find_kth_largest([3,2,1,5,8,6,4], 2) # 6
# puts find_kth_largest([3,2,3,1,2,4,5,5,6], 4) # 4
