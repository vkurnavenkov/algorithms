// LeetCode 1094. Car Pooling
// https://leetcode.com/problems/car-pooling/
//
// You are driving a vehicle that has capacity empty seats initially available for passengers.  The vehicle only drives east (ie. it cannot turn around and drive west.)
//
// Given a list of trips, trip[i] = [num_passengers, start_location, end_location] contains information about the i-th trip: the number of passengers that must be picked up, and the locations to pick them up and drop them off.  The locations are given as the number of kilometers due east from your vehicle's initial location.
//
// Return true if and only if it is possible to pick up and drop off all passengers for all the given trips.
//
//
//
// Example 1:
//
// Input: trips = [[2,1,5],[3,3,7]], capacity = 4
// Output: false
// Example 2:
//
// Input: trips = [[2,1,5],[3,3,7]], capacity = 5
// Output: true
// Example 3:
//
// Input: trips = [[2,1,5],[3,5,7]], capacity = 3
// Output: true
// Example 4:
//
// Input: trips = [[3,2,7],[3,7,9],[8,3,9]], capacity = 11
// Output: true
//

class Point {
    int location;
    int passengers;
    public Point(int passengers, int location) {
        this.passengers = passengers;
        this.location = location;
    }
}

class SortByLocation implements Comparator<Point> {
    public int compare(Point p1, Point p2) {
        if (p1.location == p2.location) return p1.passengers - p2.passengers;

        return p1.location - p2.location;
    }
}

class Solution {
    public boolean carPooling(int[][] trips, int capacity) {
        List<Point> list = new ArrayList();
        for (int[] trip: trips) {
            list.add(new Point(trip[0], trip[1]));
            list.add(new Point(-trip[0], trip[2]));
        }

        Collections.sort(list, new SortByLocation());
        int curPas = 0;
        for (Point p: list) {
            curPas += p.passengers;
            if (curPas > capacity) return false;
        }

        return true;
    }
}
