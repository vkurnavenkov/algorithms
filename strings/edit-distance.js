// Leetcode: 72. Edit Distance
//
// Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
//
// You have the following 3 operations permitted on a word:
//
// Insert a character
// Delete a character
// Replace a character
//
// Example 1:
//
// Input: word1 = "horse", word2 = "ros"
// Output: 3
// Explanation:
// horse -> rorse (replace 'h' with 'r')
// rorse -> rose (remove 'r')
// rose -> ros (remove 'e')
//

/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(word1, word2) {
    const cache = Array(word2.length + 1).fill(null).map(
        () => Array(word1.length + 1).fill(0)
    );
    for(let i = 0; i <= word1.length; i += 1) {
        cache[0][i] = i;
    }
    for(let j = 1; j <= word2.length; j += 1) {
        cache[j][0] = j;
    }

    for(let i = 1; i <= word1.length; i += 1) {
        for(let j = 1; j <= word2.length; j += 1) {
            cache[j][i] = Math.min(
                cache[j][i - 1] + 1,
                cache[j - 1][i] + 1,
                cache[j - 1][i - 1] + (word1[i - 1] === word2[j - 1] ? 0 : 1)
            );
        }
    }
    return cache[word2.length][word1.length]
};
