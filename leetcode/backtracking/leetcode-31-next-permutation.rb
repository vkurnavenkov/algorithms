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

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
    pos = nums.size - 2
    while pos >= 0 && nums[pos] >= nums[pos + 1]
        pos -= 1
    end

    if pos >= 0
        idx = pos + 2
        while idx < nums.size && nums[pos] < nums[idx]
            idx += 1
        end

        nums[pos], nums[idx - 1] = nums[idx - 1], nums[pos]
    end

    reverse(nums, pos + 1)
end

def reverse(nums, start)
    size = nums.size
    n = (size - start) / 2
    n.times { |i| nums[i + start], nums[size - 1 - i] = nums[size - 1 - i], nums[i + start] }
end
