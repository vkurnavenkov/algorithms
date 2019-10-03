# LeetCode 253. Meeting Rooms II
# https://leetcode.com/problems/meeting-rooms-ii/
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

Point = Struct.new(:x, :type)

# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
    points = []
    intervals.each do |interval|
        points.push(Point.new(interval[0], 0), Point.new(interval[1], 1))
    end

    points.sort! do |a, b|
        if a.x == b.x
            b.type <=> a.type
        else
            a.x <=> b.x
        end
    end

    max_rooms = 0
    rooms = 0
    points.each do |point|
        rooms += point.type == 0 ? 1 : -1
        max_rooms = [max_rooms, rooms].max
    end
    max_rooms
end
