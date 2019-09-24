# KMP (Knuth Morris Pratt) Pattern Searching
#

def compute_longest_prefix(str)
  m = str.size
  result = Array.new(m, 0)
  border = 0
  for i in 1..m - 1
    while border > 0 && str[i] != str[border]
      border = result[border - 1]
    end

    if str[i] == str[border]
      border += 1
    else
      border = 0
    end
    result[i] = border
  end
  result
end

def find_pattern(text, pattern)
  n = text.size
  m = pattern.size
  return [] if n < m
  lps = compute_longest_prefix("#{pattern}$#{text}")
  # puts lps.to_s
  result = []
  i = 0
  j = 0
  for i in 0..n + m
    result.push(i - 2 * m) if lps[i] == m
  end

  result
end

pattern = gets.chomp
text = gets.chomp
puts find_pattern(text, pattern).join(' ')
