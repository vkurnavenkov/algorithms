# LeetCode 973. K Closest Points to Origin
# https://leetcode.com/problems/k-closest-points-to-origin/
#
# We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
#
# (Here, the distance between two points on a plane is the Euclidean distance.)
#
# You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
#
#
#
# Example 1:
#
# Input: points = [[1,3],[-2,2]], K = 1
# Output: [[-2,2]]
# Explanation:
# The distance between (1, 3) and the origin is sqrt(10).
# The distance between (-2, 2) and the origin is sqrt(8).
# Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
# We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
# Example 2:
#
# Input: points = [[3,3],[5,-1],[-2,4]], K = 2
# Output: [[3,3],[-2,4]]
# (The answer [[-2,4],[3,3]] would also be accepted.)
#
#
# Note:
#
# 1 <= K <= points.length <= 10000
# -10000 < points[i][0] < 10000
# -10000 < points[i][1] < 10000
#

class Solution
    def solve(points, k)
        partial_sort(points, k, 0, points.size - 1)
        points[0, k]
    end

    private

    def partial_sort(points, k, l, r)
        return l > r

        idx = partition(points, l, r)
        left_len = idx - l + 1
        if left_len < k
            partial_sort(points, k, l, idx - 1)
        elsif left_len > k
            partial_sort(points, k - left_len, idx + 1, r)
        end
    end

    def partition(points, l, r)
        i = rand(l..r)
        points[l], points[i] = points[i], points[l]

        i = l + 1
        pivot = distance(points[l])
        while i <= r
            d = distance(points[i])
            if d < pivot
                swap(points, i, l)
                i += 1
                l += 1
            elsif d > pivot
                swap(points, i, r)
                r -= 1
            else
                i += 1
            end
        end
        r
    end

    def distance(point)
        Math.sqrt(point[0]**2 + point[1]**2)
    end

    def swap(points, i, j)
       points[j], points[i] = points[i], points[j]
    end
end

# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
    Solution.new.solve(points, k)
end
