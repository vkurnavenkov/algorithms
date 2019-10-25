# LeetCode 953. Verifying an Alien Dictionary
# https://leetcode.com/problems/verifying-an-alien-dictionary/
#
# In an alien language, surprisingly they also use english lowercase letters, but possibly in a different order. The order of the alphabet is some permutation of lowercase letters.
#
# Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographicaly in this alien language.
#
# Example 1:
#
# Input: words = ["hello","leetcode"], order = "hlabcdefgijkmnopqrstuvwxyz"
# Output: true
# Explanation: As 'h' comes before 'l' in this language, then the sequence is sorted.
# Example 2:
#
# Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
# Output: false
# Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
# Example 3:
#
# Input: words = ["apple","app"], order = "abcdefghijklmnopqrstuvwxyz"
# Output: false
# Explanation: The first three characters "app" match, and the second string is shorter (in size.) According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is defined as the blank character which is less than any other character (More info).
#

# Solution 1.
#

# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
    dict = { '' => 0 }
    order.each_char.with_index do |c, i|
        dict[c] = i + 1
    end
    max_len = words.max_by { |w| w.length }.length
    (0...max_len).each do |i|
        equals = false
        c = i < words[0].length ? words[0][i] : ''
        (1...words.length).each do |j|
            w = words[j]
            c2 = i < w.length ? w[i] : ''
            if c == c2
                equals = true
                next
            end
            return false if !dict[c] || !dict[c2] || dict[c] > dict[c2]
            c = c2
        end

        return true unless equals
    end
    true
end

# Solution 2.
#

# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
    dict = { '' => 0 }
    order.each_char.with_index do |c, i|
        dict[c] = i + 1
    end

    (1...words.length).each do |i|
        w1 = words[i - 1]
        w2 = words[i]
        catch(:done) do
            (0...[w1.length, w2.length].min).each do |j|
                c1 = w1[j]
                c2 = w2[j]
                next if c1 == c2

                return false if dict[c1] > dict[c2]
                throw :done
            end

            return false if w1.length > w2.length
        end
    end
    true
end
