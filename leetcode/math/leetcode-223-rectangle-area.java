// LeetCode 223. Rectangle Area
//
// Find the total area covered by two rectilinear rectangles in a 2D plane.
//
// Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.
//
// Rectangle Area
//
// Example:
//
// Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
// Output: 45
// Note:
//
// Assume that the total area is never beyond the maximum possible value of int.
//

class Solution {
    public int computeArea(int A, int B, int C, int D, int E, int F, int G, int H) {
        int baseArea = area(A, B, C, D) + area(E, F, G, H);
        if (A > G || C < E || D < F || B > H) return baseArea;

        int intArea = area(Math.max(A, E), Math.max(B, F), Math.min(C, G), Math.min(D, H));
        return baseArea - intArea;
    }

    private int area(int x1, int y1, int x2, int y2) {
        return (x2 - x1) * (y2 - y1);
    }
}
