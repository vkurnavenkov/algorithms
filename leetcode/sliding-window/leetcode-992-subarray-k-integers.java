// Leetcode 992. Subarrays with K Different Integers
//
// Given an array A of positive integers, call a (contiguous, not necessarily distinct) subarray of A good if the number of different integers in that subarray is exactly K.
//
// (For example, [1,2,3,1,2] has 3 different integers: 1, 2, and 3.)
//
// Return the number of good subarrays of A.
//
//
//
// Example 1:
//
// Input: A = [1,2,1,2,3], K = 2
// Output: 7
// Explanation: Subarrays formed with exactly 2 different integers: [1,2], [2,1], [1,2], [2,3], [1,2,1], [2,1,2], [1,2,1,2].
// Example 2:
//
// Input: A = [1,2,1,3,4], K = 3
// Output: 3
// Explanation: Subarrays formed with exactly 3 different integers: [1,2,1,3], [2,1,3], [1,3,4].
//
//
// Note:
//
// 1 <= A.length <= 20000
// 1 <= A[i] <= A.length
// 1 <= K <= A.length
//

import java.lang.System;
import java.util.HashMap;

class Solution {
    public int subarraysWithKDistinct(int[] A, int K) {
        int result = 0;
        int left = 0, right = 0;
        int prefix = 0;
        int num, cnt;
        HashMap<Integer, Integer> counts = new HashMap<>();
        int count = 0;

        while (right < A.length) {
            num = A[right];
            cnt = counts.containsKey(num) ? counts.get(num) : 0;
            if (cnt == 0) count++;
            counts.put(num, cnt + 1);

            if (count > K) {
                cnt = counts.get(A[left]);
                counts.put(A[left], cnt - 1);
                left++;
                prefix = 0;
                count--;
            }

            while (counts.get(A[left]) > 1) {
                cnt = counts.get(A[left]);
                counts.put(A[left], cnt - 1);
                left++;
                prefix++;
            }

            if (count == K) result += prefix + 1;

            right++;
        }

        return result;
    }

    public static void main (String[] args) {
      Solution solution = new Solution();

      System.out.println(solution.subarraysWithKDistinct(new int[]{2,1,1,1,2}, 1)); // 8
      System.out.println(solution.subarraysWithKDistinct(new int[]{1,2,1,2,3}, 2)); // 7
      System.out.println(solution.subarraysWithKDistinct(new int[]{1,2,2,1,2,1,2,3,4}, 3)); // 7
      System.out.println(solution.subarraysWithKDistinct(new int[]{2,2,1,2,2,2,1,1}, 2)); // 23
    }
}
