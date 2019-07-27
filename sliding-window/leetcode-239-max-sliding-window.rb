# Leetcode 239. Sliding Window Maximum
#
# Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.
#
# Example:
#
# Input: nums = [1,3,-1,-3,5,3,6,7], and k = 3
# Output: [3,3,5,5,6,7]
# Explanation:
#
# Window position                Max
# ---------------               -----
# [1  3  -1] -3  5  3  6  7       3
#  1 [3  -1  -3] 5  3  6  7       3
#  1  3 [-1  -3  5] 3  6  7       5
#  1  3  -1 [-3  5  3] 6  7       5
#  1  3  -1  -3 [5  3  6] 7       6
#  1  3  -1  -3  5 [3  6  7]      7
# Note:
# You may assume k is always valid, 1 ≤ k ≤ input array's size for non-empty array.
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
    return [] if k == 0 || k > nums.size

    left = 0
    queue = []
    result = []
    max_idx = 0

    k.times do |idx|
        clean_queue(queue, nums, idx, k)
        queue.push(idx)
        max_idx = idx if nums[max_idx] < nums[idx]
    end

    result.push(nums[max_idx])
    idx = k
    while idx < nums.size
        clean_queue(queue, nums, idx, k)
        queue.push(idx)
        idx += 1
        result.push(nums[queue.first])
    end

    result
end

def clean_queue(queue, nums, idx, k)
    # Removing all indices which are out of the sliding window.
    while !queue.empty? && queue[0] <= idx - k
        queue.shift
    end

    # Removing all indices which are less than new one in the sliding window.
    while !queue.empty? && nums[queue.last] < nums[idx]
        queue.pop
    end
end
