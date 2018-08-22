# Leetcode 253. Meeting Rooms II
#
# Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
#
# Example 1:
#
# Input: [[0, 30],[5, 10],[15, 20]]
# Output: 2
# Example 2:
#
# Input: [[7,10],[2,4]]
# Output: 1
#
#
# IntervalPoint = Struct.new(:val, :type) do
#     def left?
#         type == 0
#     end
# end

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
    return 0 if intervals.empty?
    return 1 if intervals.size == 1

    points = []
    intervals.each do |interval|
        points.push(
            IntervalPoint.new(interval.start, 0),
            IntervalPoint.new(interval.end, 1)
        )
    end
    points.sort! do |a, b|
        if a.val == b.val
            b.type <=> a.type
        else
            a.val <=> b.val
        end
    end

    max_rooms = 0
    rooms = 0
    points.each do |point|
        rooms += point.left? ? 1 : -1
        max_rooms = rooms if max_rooms < rooms
    end
    max_rooms
end
