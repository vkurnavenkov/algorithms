// LeetCode 278. First Bad Version
// https://leetcode.com/problems/first-bad-version/
//
// You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
// Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//
// You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
//
// Example:
//
// Given n = 5, and version = 4 is the first bad version.
//
// call isBadVersion(3) -> false
// call isBadVersion(5) -> true
// call isBadVersion(4) -> true
//
// Then 4 is the first bad version.
//

/* The isBadVersion API is defined in the parent class VersionControl.
      boolean isBadVersion(int version); */

public class Solution extends VersionControl {
    public int firstBadVersion(int n) {
        int l = 1;
        int r = n;

        int version = n;
        while (l <= r) {
            int mid = l + (r - l) / 2;
            boolean bad = isBadVersion(mid);
            if (bad) {
                if (version > mid) version = mid;
                r = mid - 1;
            } else {
                l = mid + 1;
            }
        }

        return version;
    }
}