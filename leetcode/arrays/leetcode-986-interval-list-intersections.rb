# LeetCode 986. Interval List Intersections
# https://leetcode.com/problems/interval-list-intersections/
#
# Given two lists of closed intervals, each list of intervals is pairwise disjoint and in sorted order.
#
# Return the intersection of these two interval lists.
#
# (Formally, a closed interval [a, b] (with a <= b) denotes the set of real numbers x with a <= x <= b.  The intersection of two closed intervals is a set of real numbers that is either empty, or can be represented as a closed interval.  For example, the intersection of [1, 3] and [2, 4] is [2, 3].)
#
# Example 1:
#
# Input: A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
# Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]
# Reminder: The inputs and the desired output are lists of Interval objects, and not arrays or lists.
#

# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
    return [] if a.length == 0 || b.length == 0

    result = []
    p1 = 0
    p2 = 0
    while p1 < a.length && p2 < b.length
        if a[p1][1] < b[p2][0]
            p1 += 1
        elsif b[p2][1] < a[p1][0]
            p2 += 1
        else
            result.push([[a[p1][0], b[p2][0]].max, [a[p1][1], b[p2][1]].min])
            if a[p1][1] < b[p2][1]
                p1 += 1
            else
                p2 += 1
            end
        end
    end

    result
end
