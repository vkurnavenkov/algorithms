# Leetcode 645. Set Mismatch
#
# The set S originally contains numbers from 1 to n. But unfortunately, due to the data error, one of the numbers in the set got duplicated to another number in the set, which results in repetition of one number and loss of another number.
#
# Given an array nums representing the data status of this set after the error. Your task is to firstly find the number occurs twice and then find the number that is missing. Return them in the form of an array.
#
# Example 1:
# Input: nums = [1,2,2,4]
# Output: [2,3]
# Note:
# The given array size will in the range [2, 10000].
# The given array's numbers won't have any order.
#

# Solution 1.
# Runtime complexity: O(n)
# Space complexity: O(n)

# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
    duplicate = -1
    s = Set.new
    cur_sum = 0
    nums.each do |n|
        duplicate = n if s.include?(n)
        cur_sum += n
        s.add(n)
    end

    sum = nums.size * (nums.size + 1) / 2
    [duplicate, duplicate + sum - cur_sum]
end

# Solution 1.
# Runtime complexity: O(n)
# Space complexity: O(1) - original array modification

# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
    dup = nil
    lost = nil
    (0...nums.size).each do |i|
        idx = nums[i].abs - 1
        if nums[idx] < 0
            dup = nums[i].abs
        else
            nums[idx] = -nums[idx]
        end
    end

    (0...nums.size).each do |i|
        if nums[i] > 0
            lost = i + 1
            break
        end
    end

    [dup, lost]
end
