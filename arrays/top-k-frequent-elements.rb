# Leetcode 347. Top K Frequent Elements
#
# Given a non-empty array of integers, return the k most frequent elements.
#
# Example 1:
#
# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]
#
# Example 2:
#
# Input: nums = [1], k = 1
# Output: [1]
# Note:
#
# You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
# Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
#

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
    freq = Hash.new { 0 }
    nums.each { |val| freq[val] += 1 }
    bucket = Array.new(nums.size)
    freq.each_key do |val|
        count = freq[val]
        if bucket[count - 1]
            bucket[count - 1].push(val)
        else
            bucket[count - 1] = [val]
        end
    end
    result = []
    idx = bucket.size - 1
    while idx >= 0 && result.size < k
        result += bucket[idx] if bucket[idx]
        idx -= 1
    end
    result.first(k)
end

puts top_k_frequent([1,1,1,2,2,3], 2).to_s # [1,2]
