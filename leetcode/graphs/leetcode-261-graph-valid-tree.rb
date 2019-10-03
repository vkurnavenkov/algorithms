# LeetCode 261. Graph Valid Tree
# https://leetcode.com/problems/graph-valid-tree/
#
# Given n nodes labeled from 0 to n-1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
#
# Example 1:
#
# Input: n = 5, and edges = [[0,1], [0,2], [0,3], [1,4]]
# Output: true
# Example 2:
#
# Input: n = 5, and edges = [[0,1], [1,2], [2,3], [1,3], [1,4]]
# Output: false
# Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0,1] is the same as [1,0] and thus will not appear together in edges.
#

class Solution
    def solve(n, edges)
        adj_list = Array.new(n) { [] }
        edges.each do |u, v|
            adj_list[u].push(v)
            adj_list[v].push(u)
        end

        !is_acyclic_and_connected(adj_list)
    end

    private

    def is_acyclic_and_connected(adj_list)
        visited = Array.new(adj_list.size, 0)

        components = 0
        (0...adj_list.size).each do |u|
            return true if visited[u] == 0 && components > 0

            if visited[u] == 0
                return true if acyclic_dfs(adj_list, u, -1, visited)
                components += 1
            end
        end
        false
    end

    def acyclic_dfs(adj_list, u, parent, visited)
        visited[u] = 1

        adj_list[u].each do |v|
            next if v == parent

            return true if visited[v] == 1 || acyclic_dfs(adj_list, v, u, visited)
        end

        visited[u] = 2
        false
    end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
def valid_tree(n, edges)
    Solution.new.solve(n, edges)
end
