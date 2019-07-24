# Leetcode 76. Minimum Window Substring
#
# Given a string S and a string T, find the minimum window in S
# which will contain all the characters in T in complexity O(n).
#
# Example:
#
# Input: S = "ADOBECODEBANC", T = "ABC"
# Output: "BANC"
# Note:
#
# If there is no such window in S that covers all characters in T, return the empty string "".
# If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
#

def min_window(s, t)
  max_counts =
    t.chars.reduce({}) do |rv, c|
      if rv.key?(c)
        rv[c] += 1
      else
        rv[c] = 1
      end
      rv
    end

  chars_left = max_counts.size
  counts = Hash.new { 0 }
  left = 0
  right = 0
  result_left = -1
  result_right = -1

  while right < s.length
    char = s[right]
    if max_counts[char]
      counts[char] += 1
      chars_left -= 1 if max_counts[char] == counts[char]
    end

    while chars_left == 0 && left <= right
      c = s[left]
      if max_counts[c]
        if max_counts[c] == counts[c]
          if result_left == -1 || (right - left < result_right - result_left)
            result_left = left
            result_right = right
          end
          chars_left += 1
        end
        counts[c] -= 1
      end
      left += 1
    end

    right += 1
  end

  result_left == -1 ? "" : s[result_left..result_right]
end

puts min_window("ADOBECODEBANC", "ABC") # "BANC"
puts min_window("ADOBECODEBANC", "ABCC") # "CODEBANC"
puts min_window("ADOBECODEBANC", "AHCA") # ""
