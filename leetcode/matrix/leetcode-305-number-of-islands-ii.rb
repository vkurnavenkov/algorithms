# LeetCode 305. Number of Islands II
# https://leetcode.com/problems/number-of-islands-ii/
#

class Solution
    def solve(m, n, positions)
        grid = Array.new(m) { Array.new(n, 0) }
        parents = Array.new(m * n)
        ranks = Array.new(m * n, 0)

        list = []
        islands = 0
        deltas = [[0, 1], [0, -1], [1, 0], [-1, 0]]
        positions.each do |r, c|
            val = r * n + c
            if grid[r][c] == 0
                grid[r][c] = 1
                islands += 1
                parents[val] = val
            end

            deltas.each do |dr, dc|
                if in_bound?(grid, r + dr, c + dc) && grid[r + dr][c + dc] == 1
                    islands -= 1 if union(val, (r + dr) * n + c + dc, parents, ranks)
                end
            end

            list.push(islands)
        end
        list
    end

    private

    def in_bound?(grid, r, c)
        r >= 0 && r < grid.size && c >= 0 && c < grid[0].size
    end

    def find_parent(val, parents)
        while parents[val] != val
            # with path compression
            parents[val] = parents[parents[val]]
            val = parents[val]
        end
        val
    end

    def union(val1, val2, parents, ranks)
        parent1 = find_parent(val1, parents)
        parent2 = find_parent(val2, parents)

        return false if parent1 == parent2

        if ranks[parent1] > ranks[parent2]
            parents[parent2] = parent1
        elsif ranks[parent1] < ranks[parent2]
            parents[parent1] = parent2
        else
            parents[parent1] = parent2
            ranks[parent2] += 1
        end
        true
    end
end

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} positions
# @return {Integer[]}
def num_islands2(m, n, positions)
    Solution.new.solve(m, n, positions)
end
