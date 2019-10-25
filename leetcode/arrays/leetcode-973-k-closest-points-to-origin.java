// LeetCode 973. K Closest Points to Origin
// https://leetcode.com/problems/k-closest-points-to-origin/
//
// We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
//
// (Here, the distance between two points on a plane is the Euclidean distance.)
//
// You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
//
//
//
// Example 1:
//
// Input: points = [[1,3],[-2,2]], K = 1
// Output: [[-2,2]]
// Explanation:
// The distance between (1, 3) and the origin is sqrt(10).
// The distance between (-2, 2) and the origin is sqrt(8).
// Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
// We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
// Example 2:
//
// Input: points = [[3,3],[5,-1],[-2,4]], K = 2
// Output: [[3,3],[-2,4]]
// (The answer [[-2,4],[3,3]] would also be accepted.)
//
//
// Note:
//
// 1 <= K <= points.length <= 10000
// -10000 < points[i][0] < 10000
// -10000 < points[i][1] < 10000
//

class Solution {
    public int[][] kClosest(int[][] points, int k) {
        quickSelect(points, k, 0, points.length - 1);
        int[][] result = new int[k][2];
        for (int i = 0; i < k; i++) {
            result[i][0] = points[i][0];
            result[i][1] = points[i][1];
        }
        return result;
    }

    private void quickSelect(int[][] points, int k, int l, int r) {
        if (l > r) return;

        int mid = partition(points, l, r);
        int len = mid - l + 1;
        if (len < k) {
            quickSelect(points, k - len, mid + 1, r);
        } else if (len > k) {
            quickSelect(points, k, l, mid - 1);
        }
    }

    private int partition(int[][] points, int l, int r) {
        Random random = new Random();
        int d = random.nextInt(r - l + 1);
        swap(points, l, l + d);
        int pivot = distance(points[l]);
        int i = l + 1;
        while (i <= r) {
            int dist = distance(points[i]);
            if (dist < pivot) {
                swap(points, l, i);
                l++;
                i++;
            } else if (dist > pivot) {
                swap(points, i, r);
                r--;
            } else {
                i++;
            }
        }

        return r;
    }

    private void swap(int[][] points, int i, int j) {
        int x = points[i][0];
        int y = points[i][1];
        points[i][0] = points[j][0];
        points[i][1] = points[j][1];
        points[j][0] = x;
        points[j][1] = y;
    }

    private int distance(int[] p) {
        return p[0] * p[0] + p[1] * p[1];
    }
}
