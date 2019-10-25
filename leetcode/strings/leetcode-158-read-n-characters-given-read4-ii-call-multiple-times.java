// LeetCode 158. Read N Characters Given Read4 II - Call multiple times
// https://leetcode.com/problems/read-n-characters-given-read4-ii-call-multiple-times/
//
// Given a file and assume that you can only read the file using a given method read4, implement a method read to read n characters. Your method read may be called multiple times.
//
//
//
// Method read4:
//
// The API read4 reads 4 consecutive characters from the file, then writes those characters into the buffer array buf.
//
// The return value is the number of actual characters read.
//
// Note that read4() has its own file pointer, much like FILE *fp in C.
//
// Definition of read4:
//
//     Parameter:  char[] buf
//     Returns:    int
//

/**
 * The read4 API is defined in the parent class Reader4.
 *     int read4(char[] buf);
 */
public class Solution extends Reader4 {
    Queue<Character> readAhead = new LinkedList();
    /**
     * @param buf Destination buffer
     * @param n   Number of characters to read
     * @return    The number of actual characters read
     */
    public int read(char[] buf, int n) {
        char[] localBuf = new char[4];

        int ptr;
        for (ptr = 0; ptr < n && !readAhead.isEmpty(); ptr++) {
            char c = readAhead.poll();
            buf[ptr] = c;
        }
        if (ptr == n) return n;

        int count = 4;
        while (ptr < n && count == 4) {
            count = read4(localBuf);
            for (int i = 0; i < count; i++) {
                if (ptr < n) {
                    buf[ptr] = localBuf[i];
                    ptr++;
                } else {
                    readAhead.offer(localBuf[i]);
                }
            }
        }

        return ptr;
    }
}
