# LeetCode 416. Partition Equal Subset Sum
#
# Given a non-empty array containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
#
# Note:
#
# Each of the array element will not exceed 100.
# The array size will not exceed 200.
#
#
# Example 1:
#
# Input: [1, 5, 11, 5]
#
# Output: true
#
# Explanation: The array can be partitioned as [1, 5, 5] and [11].
#
#
# Example 2:
#
# Input: [1, 2, 3, 5]
#
# Output: false
#
# Explanation: The array cannot be partitioned into equal sum subsets.
#

# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
    sum = nums.reduce(:+)
    return false if sum % 2 == 1

    sum /= 2
    dp = Array.new(sum + 1, false)
    dp[0] = true
    nums.each do |v|
        return false if v > sum

        sum.downto(1).each do |i|
            dp[i] ||= dp[i - v] if i >= v
        end
    end
    dp[-1]
end
