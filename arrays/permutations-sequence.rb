# Leetcode 60. Permutation Sequence
#
# The set [1,2,3,...,n] contains a total of n! unique permutations.
#
# By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
#
# "123"
# "132"
# "213"
# "231"
# "312"
# "321"
# Given n and k, return the kth permutation sequence.
#
# Note:
#
# Given n will be between 1 and 9 inclusive.
# Given k will be between 1 and n! inclusive.
#
# Example 1:
#
# Input: n = 3, k = 3
# Output: "213"
#
# Example 2:
#
# Input: n = 4, k = 9
# Output: "2314"
#
# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
    numbers = n.times.map { |v| v + 1 }
    factorials = Array.new(n).tap { |arr| arr[0] = 1 }
    result = []
    sum = 1
    for idx in 1..n-1
        sum *= idx
        factorials[idx] = sum
    end
    k -= 1
    idx = n - 1
    while idx >= 0
        r = k / factorials[idx]
        val = numbers.delete_at(r)
        result.push(val)
        k %= factorials[idx]
        idx -= 1
    end
    result.join
end
