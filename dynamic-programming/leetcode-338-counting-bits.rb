# Leetcode 338. Counting Bits
#
# Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
#
# Example 1:
#
# Input: 2
# Output: [0,1,1]
# Example 2:
#
# Input: 5
# Output: [0,1,1,2,1,2]
#

# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
    result = Array.new(num + 1, 0)
    (1..num).each do |i|
        result[i] = result[i & i - 1] + 1
    end
    result
end
