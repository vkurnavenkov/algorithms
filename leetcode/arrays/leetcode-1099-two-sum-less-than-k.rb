# LeetCode 1099. Two Sum Less Than K
# https://leetcode.com/problems/two-sum-less-than-k/
#

# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def two_sum_less_than_k(a, k)
    a.sort!
    i = 0
    j = a.size - 1
    result = -1
    while i < j
        if a[i] + a[j] < k
            result = a[i] + a[j] if a[i] + a[j] > result
            i += 1
        else
            j -= 1
        end
    end
    result
end
