# Given a collection of intervals, merge all overlapping intervals.
#
# Example 1:
#
# Input: [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
# Example 2:
#
# Input: [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considerred overlapping.
#
# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
    return intervals if intervals.empty?
    intervals.sort! { |a, b| a.start <=> b.start }
    start_val, end_val = intervals[0].start, intervals[0].end
    results = []
    for i in 1..intervals.size - 1
        if intervals[i].start <= end_val
            end_val = [end_val, intervals[i].end].max
        else
            results.push(Interval.new(start_val, end_val))
            start_val, end_val = intervals[i].start, intervals[i].end
        end
    end
    results.push(Interval.new(start_val, end_val))
end
