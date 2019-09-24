// LeetCode 305. Number of Islands II
// https://leetcode.com/problems/number-of-islands-ii/
//

class Solution {
    public List<Integer> numIslands2(int m, int n, int[][] positions) {
        int[][] grid = new int[m][n];
        int[] parents = new int[m * n];
        int[] ranks = new int[m * n];
        for (int i = 0; i < m * n; i++) parents[i] = i;
        int[][] delta = new int[][] { {1, 0}, {-1, 0}, {0, 1}, {0, -1} };
        int count = 0;
        List<Integer> list = new ArrayList();

        for (int[] pos: positions) {
            int val = pos[0] * n + pos[1];
            if (grid[pos[0]][pos[1]] != 1) {
                grid[pos[0]][pos[1]] = 1;
                count++;
            }
            for (int d = 0; d < delta.length; d++) {
                int r = pos[0] + delta[d][0];
                int c = pos[1] + delta[d][1];
                if (inBound(m, n, r, c) && grid[r][c] == 1) {
                    if (unionSet(val, r * n + c, parents, ranks)) count--;
                }
            }
            list.add(count);
        }
        return list;
    }

    private int findParent(int val, int[] parents, int[] ranks) {
        while (val != parents[val]) val = parents[val];
        return val;
    }

    private boolean unionSet(int val1, int val2, int[] parents, int[] ranks) {
        int parent1 = findParent(val1, parents, ranks);
        int parent2 = findParent(val2, parents, ranks);
        if (parent1 == parent2) return false;

        if (ranks[val1] > ranks[val2]) {
            parents[parent2] = parent1;
        } else if (ranks[val1] < ranks[val2]) {
            parents[parent1] = parent2;
        } else {
            parents[parent1] = parent2;
            ranks[val2]++;
        }
        return true;
    }

    private boolean inBound(int m, int n, int r, int c) {
        return r >= 0 && r < m && c >= 0 && c < n;
    }
}
