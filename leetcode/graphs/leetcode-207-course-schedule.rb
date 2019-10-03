# LeetCode 207. Course Schedule
# https://leetcode.com/problems/course-schedule/
#
# There are a total of n courses you have to take, labeled from 0 to n-1.
#
# Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
#
# Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?
#
# Example 1:
#
# Input: 2, [[1,0]]
# Output: true
# Explanation: There are a total of 2 courses to take.
#              To take course 1 you should have finished course 0. So it is possible.
# Example 2:
#
# Input: 2, [[1,0],[0,1]]
# Output: false
# Explanation: There are a total of 2 courses to take.
#              To take course 1 you should have finished course 0, and to take course 0 you should
#              also have finished course 1. So it is impossible.
#

class Solution
    def solve(num_courses, prerequisites)
        adj_list = Array.new(num_courses) { [] }
        prerequisites.each do |u, v|
            adj_list[v].push(u)
        end

        # toposort(adj_list)
        !isAcyclic?(adj_list)
    end

    private

    def isAcyclic?(adj_list)
        visited = Array.new(adj_list.size, 0)

        (0...adj_list.size).each do |u|
            if visited[u] == 0
                return true if dfs(adj_list, u, visited)
            end
        end
        false
    end

    def dfs(adj_list, u, visited)
        visited[u] = 1
        adj_list[u].each do |v|
            return true if visited[v] == 1 || dfs(adj_list, v, visited)
        end
        visited[u] = 2
        false
    end

    def toposort(adj_list)
        in_degree = Array.new(adj_list.size, 0)
        adj_list.each do |edges|
            edges.each do |v|
                in_degree[v] += 1
            end
        end

        queue = []
        (0...in_degree.size).each do |u|
            queue.push(u) if in_degree[u] == 0
        end

        count = 0
        while !queue.empty?
            u = queue.shift
            count += 1
            adj_list[u].each do |v|
                in_degree[v] -= 1
                queue.push(v) if in_degree[v] == 0
            end
        end

        count == adj_list.size
    end
end

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
    Solution.new.solve(num_courses, prerequisites)
end
