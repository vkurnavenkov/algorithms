# Leetcode 992. Subarrays with K Different Integers
#
# Given an array A of positive integers, call a (contiguous, not necessarily distinct) subarray of A good if the number of different integers in that subarray is exactly K.
#
# (For example, [1,2,3,1,2] has 3 different integers: 1, 2, and 3.)
#
# Return the number of good subarrays of A.
#
#
#
# Example 1:
#
# Input: A = [1,2,1,2,3], K = 2
# Output: 7
# Explanation: Subarrays formed with exactly 2 different integers: [1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2].
# Example 2:
#
# Input: A = [1,2,1,3,4], K = 3
# Output: 3
# Explanation: Subarrays formed with exactly 3 different integers: [1,2,1,3], [2,1,3], [1,3,4].
#
#
# Note:
#
# 1 <= A.length <= 20000
# 1 <= A[i] <= A.length
# 1 <= K <= A.length
#

# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def subarrays_with_k_distinct(a, k)
    left = 0
    right = 0
    counts = Hash.new(0)
    count = 0
    result = 0
    prefix = 0

    while right < a.size
        num = a[right]
        count += 1 if counts[num] == 0
        counts[num] += 1

        if count > k
            counts[a[left]] -= 1
            left += 1
            count -= 1
            prefix = 0
        end

        while counts[a[left]] > 1
            counts[a[left]] -= 1
            left += 1
            prefix += 1
        end

        result += prefix + 1 if count == k # Found a window
        right += 1
    end

    result
end

puts subarrays_with_k_distinct([2,1,1,1,2], 1) # 8
puts subarrays_with_k_distinct([1,2,1,2,3], 2) # 7
puts subarrays_with_k_distinct([1,2,2,1,2,1,2,3,4], 3) # 7
