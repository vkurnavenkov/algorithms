// LeetCode 56. Merge Intervals
//
// Given a collection of intervals, merge all overlapping intervals.
//
// Example 1:
//
// Input: [[1,3],[2,6],[8,10],[15,18]]
// Output: [[1,6],[8,10],[15,18]]
// Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
// Example 2:
//
// Input: [[1,4],[4,5]]
// Output: [[1,5]]
// Explanation: Intervals [1,4] and [4,5] are considered overlapping.
//

class Solution {
    private class IntervalComparator implements Comparator<int[]> {
        public int compare(int[] a, int[] b) {
            return Integer.compare(a[0], b[0]);
        }
    }
    public int[][] merge(int[][] intervals) {
        if (intervals.length == 0) return intervals;
        Arrays.sort(intervals, new IntervalComparator());
        List<int[]> list = new ArrayList();
        for(int[] p: intervals) {
            if (list.isEmpty() || list.get(list.size() - 1)[1] < p[0]) list.add(p);
            else list.get(list.size() - 1)[1] = Math.max(list.get(list.size() - 1)[1], p[1]);
        }
        int[][] res = new int[list.size()][2];
        for (int i = 0; i < list.size(); i++) {
            res[i] = list.get(i);
        }
        return res;
    }
}
