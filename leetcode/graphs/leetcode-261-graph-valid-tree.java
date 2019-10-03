// LeetCode 261. Graph Valid Tree
// https://leetcode.com/problems/graph-valid-tree/
//
// Given n nodes labeled from 0 to n-1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
//
// Example 1:
//
// Input: n = 5, and edges = [[0,1], [0,2], [0,3], [1,4]]
// Output: true
// Example 2:
//
// Input: n = 5, and edges = [[0,1], [1,2], [2,3], [1,3], [1,4]]
// Output: false
// Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0,1] is the same as [1,0] and thus will not appear together in edges.
//

class Solution {
    public boolean validTree(int n, int[][] edges) {
        List<Integer>[] adjList = new List[n];

        for (int u = 0; u < n; u++)
            adjList[u] = new LinkedList();

        for(int[] edge: edges) {
            int u = edge[0], v = edge[1];
            adjList[u].add(v);
            adjList[v].add(u);
        }

        return !isAcyclicAndConnected(adjList);
    }

    private boolean isAcyclicAndConnected(List<Integer>[] adjList) {
        int[] visited = new int[adjList.length];

        int components = 0;
        for (int u = 0; u < adjList.length; u++) {
            if (components > 0 && visited[u] == 0) return true;

            if (visited[u] == 0) {
                if (acyclicDfs(adjList, u, -1, visited)) return true;
                components++;
            }
        }

        return false;
    }

    private boolean acyclicDfs(List<Integer>[] adjList, int u, int parent, int[] visited) {
        visited[u] = 1;
        for (int v: adjList[u]) {
            if (v == parent) continue;

            if (visited[v] == 1 || acyclicDfs(adjList, v, u, visited)) return true;
        }
        visited[u] = 2;
        return false;
    }
}
