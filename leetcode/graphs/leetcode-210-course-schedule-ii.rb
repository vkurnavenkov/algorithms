# LeetCode 210. Course Schedule II
# https://leetcode.com/problems/course-schedule-ii/
#
# There are a total of n courses you have to take, labeled from 0 to n-1.
#
# Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]
#
# Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should take to finish all courses.
#
# There may be multiple correct orders, you just need to return one of them. If it is impossible to finish all courses, return an empty array.
#
# Example 1:
#
# Input: 2, [[1,0]]
# Output: [0,1]
# Explanation: There are a total of 2 courses to take. To take course 1 you should have finished
#              course 0. So the correct course order is [0,1] .
# Example 2:
#
# Input: 4, [[1,0],[2,0],[3,1],[3,2]]
# Output: [0,1,2,3] or [0,2,1,3]
# Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both
#              courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
#              So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3] .
# Note:
#
# The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
# You may assume that there are no duplicate edges in the input prerequisites.
#

class Solution
    def solve(num_courses, prerequisites)
        adj_list = Array.new(num_courses) { [] }
        prerequisites.each do |v, u|
            adj_list[u].push(v)
        end

        toposort_bfs(adj_list)
    end

    private

    # Kahn's algorithm
    def toposort_bfs(adj_list)
        in_degree = Array.new(adj_list.size, 0)
        (0...adj_list.size).each do |u|
            adj_list[u].each do |v|
                in_degree[v] += 1
            end
        end

        queue = []
        (0...in_degree.size).each do |u|
            queue.push(u) if in_degree[u] == 0
        end

        result = []
        while !queue.empty?
            u = queue.shift
            result.push(u)
            adj_list[u].each do |v|
                in_degree[v] -= 1
                queue.push(v) if in_degree[v] == 0
            end
        end

        result.size == in_degree.size ? result : []
    end
end

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def find_order(num_courses, prerequisites)
    Solution.new.solve(num_courses, prerequisites)
end
