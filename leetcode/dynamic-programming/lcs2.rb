#Longest Common Subsequence

def print_m(m, a, b)
  a_array = [' '] + a
  b_array = [' ', ' '] + b
  puts b_array.join(' ')
  m.each.with_index do |row, idx|
    puts ([a_array[idx]] + row).join(' ')
  end
end

def lcs2(a, b)
  m = Array.new(a.length + 1) { Array.new(b.length + 1, 0) }

  for i in (1..a.length)
    for j in (1..b.length)
      m[i][j] =
        if a[i - 1] == b[j - 1]
          m[i - 1][j - 1] + 1
        else
          [m[i][j - 1], m[i - 1][j]].max
        end
    end
  end

  m[a.length][b.length]
end

data = STDIN.read.split.map(&:to_i)
n = data[0]
a = data[1..n]
m = data[n+1]
b = data[n+2..n+1+m]
puts lcs2(a, b)
