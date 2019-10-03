# LeetCode 621. Task Scheduler
# https://leetcode.com/problems/task-scheduler/
#
# Given a char array representing tasks CPU need to do. It contains capital letters A to Z where different letters represent different tasks. Tasks could be done without original order. Each task could be done in one interval. For each interval, CPU could finish one task or just be idle.
#
# However, there is a non-negative cooling interval n that means between two same tasks, there must be at least n intervals that CPU are doing different tasks or just be idle.
#
# You need to return the least number of intervals the CPU will take to finish all the given tasks.
#
#
#
# Example:
#
# Input: tasks = ["A","A","A","B","B","B"], n = 2
# Output: 8
# Explanation: A -> B -> idle -> A -> B -> idle -> A -> B.
#
#
# Note:
#
# The number of tasks is in the range [1, 10000].
# The integer n is in the range [0, 100].
#

# Solution 1
# Runtime complexity: O(n), where n  - number of tasks
#

# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    counts =
        tasks.each_with_object({}) do |t, rv|
            rv[t] = 0 unless rv.key?(t)
            rv[t] += 1
        end.values.sort { |a, b| b <=> a }

    intervals = 0
    while counts[0] > 0
        i = 0
        while i <= n && i < counts.size && counts[i] != 0
            intervals += 1
            counts[i] -= 1
            i += 1
        end
        intervals += n - i + 1 if counts[0] > 0
        counts.sort! { |a, b| b <=> a }
    end

    return intervals
end

# Solution 2
# Runtime complexity: O(n), where n  - number of tasks
#

# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
    max_tasks = 0
    count = 0

    counts = {}
    tasks.each do |t|
        counts[t] = 0 unless counts.key?(t)
        counts[t] += 1
        if counts[t] >= max_tasks
            count = 0 if counts[t] > max_tasks
            max_tasks = counts[t]
            count += 1
        end
    end

    max_tasks_area = max_tasks * count
    other_area = (max_tasks - 1) * (n - count + 1)

    return [tasks.length, max_tasks_area + other_area].max
end
