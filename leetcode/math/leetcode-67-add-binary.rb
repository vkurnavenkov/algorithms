# LeetCode 67. Add Binary
# https://leetcode.com/problems/add-binary/
#
# Given two binary strings, return their sum (also a binary string).
#
# The input strings are both non-empty and contains only characters 1 or 0.
#
# Example 1:
#
# Input: a = "11", b = "1"
# Output: "100"
# Example 2:
#
# Input: a = "1010", b = "1011"
# Output: "10101"
#

# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
    pa = a.length - 1
    pb = b.length - 1
    carry = 0
    result = []

    while pa >= 0 || pb >= 0
        v1 =  pa >= 0 ? a[pa].ord - '0'.ord : 0
        v2 =  pb >= 0 ? b[pb].ord - '0'.ord : 0
        result.push((v1 + v2 + carry) % 2)
        carry = (v1 + v2 + carry) / 2
        pa -= 1
        pb -= 1
    end

    if carry == 1
        result.push(carry)
    end

    (result.size - 1).downto(0).reduce('') do |rv, i|
        rv += result[i].to_s
    end
end
