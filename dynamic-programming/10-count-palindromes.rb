# Given a string, the task is to count all palindrome substring in a given string.
# Length of palindrome substring is greater then or equal to 2.
#
# Input : str = "abaab"
# Output: 3
# Explanation :
# All palindrome substring are :
#  "aba" , "aa" , "baab"
#
# Input : str = "abbaeae"
# Output: 4
# Explanation :
# All palindrome substring are :
# "bb" , "abba" ,"aea","eae"

def count_palindromes(str)
  n = str.size
  pali = Array.new(n) { Array.new(n, false) }
  counts = Array.new(n) { Array.new(n, 0) }
  (0..n - 1).each { |i| pali[i][i] = true }
  (0..n - 2).each do |i|
    if str[i] == str[i + 1]
      pali[i][i + 1] = true
      counts[i][i + 1] = 1
    end
  end

  (2..n - 1).each do |gap|
    (0..n - 1 - gap).each do |i|
      j = i + gap
      pali[i][j] = pali[i + 1][j - 1] && str[i] == str[j]
      counts[i][j] = counts[i + 1][j] + counts[i][j - 1] - counts[i + 1][j - 1] + (pali[i][j] ? 1 : 0)
    end
  end
  counts[0][n - 1]
end

def count_palindromes_hash(str)
  n = str.size
  h = Hash.new { |h, k| h[k] = 0 }
  (0..n - 2).each do |i|
    # odd
    d = 1
    while d <= i && i + d < n && str[i - d] == str[i + d]
      h[[i - d, i + d]] += 1
      d += 1
    end

    # even
    d = 0
    while d <= i && i + d + 1 < n && str[i - d] == str[i + d + 1]
      h[[i - d, i + d + 1]] += 1
      d += 1
    end
  end
  h.size
end

puts count_palindromes('baab') # 2
puts count_palindromes('abaab') # 3
puts count_palindromes('abbaeae') # 4
puts count_palindromes('abbaea') # 3
puts '------------------'
puts count_palindromes_hash('baab') # 2
puts count_palindromes_hash('abaab') # 3
puts count_palindromes_hash('abbaeae') # 4
puts count_palindromes_hash('abbaea') # 3
