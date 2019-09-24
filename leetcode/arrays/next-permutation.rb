# Leetcode 31. Next Permutation
#
# Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
#
# If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
#
# The replacement must be in-place and use only constant extra memory.
#
# Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
#
# 1,2,3 → 1,3,2
# 3,2,1 → 1,2,3
# 1,1,5 → 1,5,1
#

def swap(nums, idx)
    j = nums.size - 1
    while j > idx && nums[j] <= nums[idx]
        j -= 1
    end
    nums[idx], nums[j] = nums[j], nums[idx]
    nums
end

def reverse(nums, idx)
    l = idx
    r = nums.size - 1
    while l < r
        nums[l], nums[r] = nums[r], nums[l]
        l += 1
        r -= 1
    end
    nums
end

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    return nil if nums.size <= 1
    # Find a local max
    idx = nums.size - 1
    while idx > 0 && nums[idx] <= nums[idx - 1]
        idx -= 1
    end
    if idx > 0
        # Found a local max
        swap(nums, idx - 1)
    end

    reverse(nums, idx)
end
