// LeetCode 207. Course Schedule
// https://leetcode.com/problems/course-schedule/
//
// There are a total of n courses you have to take, labeled from 0 to n-1.
//
// Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
//
// Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
//
// Example 1:
//
// Input: 2, [[1,0]]
// Output: true
// Explanation: There are a total of 2 courses to take.
//              To take course 1 you should have finished course 0. So it is possible.
// Example 2:
//
// Input: 2, [[1,0],[0,1]]
// Output: false
// Explanation: There are a total of 2 courses to take.
//              To take course 1 you should have finished course 0, and to take course 0 you should
//              also have finished course 1. So it is impossible.
//

class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<Integer>[] adjList = new ArrayList[numCourses];
        for (int u = 0; u < adjList.length; u++) {
            adjList[u] = new ArrayList();
        }

        for (int[] edges: prerequisites) {
            adjList[edges[1]].add(edges[0]);
        }

        return topoSort(adjList);
    }

    private boolean topoSort(List<Integer>[] adjList) {
        int[] inDegree = new int[adjList.length];
        for (int u = 0; u < adjList.length; u++) {
            for (int v: adjList[u]) inDegree[v]++;
        }

        Queue<Integer> queue = new LinkedList();
        for (int u = 0; u < inDegree.length; u++) {
            if (inDegree[u] == 0) queue.offer(u);
        }

        int count = 0;
        while (!queue.isEmpty()) {
            int u = queue.poll();
            count++;
            for (int v: adjList[u]) {
                if (--inDegree[v] == 0) queue.offer(v);
            }
        }
        return count == inDegree.length;
    }
}
