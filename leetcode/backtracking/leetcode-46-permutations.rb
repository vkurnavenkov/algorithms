# Leetcode 46. Permutations.
#
# Given a collection of distinct integers, return all possible permutations.
#
# Example:
#
# Input: [1,2,3]
# Output:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]
#

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    results = []
    do_permute(nums, 0, results)

    results
end

def do_permute(nums, start, results)
    if start == nums.size
        results.push(nums.clone)
        return
    end

    (start..nums.size-1).each do |i|
        nums[start], nums[i] = nums[i], nums[start]
        do_permute(nums, start + 1, results)
        nums[start], nums[i] = nums[i], nums[start]
    end
end
