##Longest Common Subsequence

def lcs3(a, b, c)
  m = Array.new(a.length + 1) { Array.new(b.length + 1) { Array.new(c.length + 1, 0) } }

  for i in (1..a.length)
    for j in (1..b.length)
      for k in (1..c.length)
        m[i][j][k] =
          if a[i - 1] == b[j - 1] && b[j - 1] == c[k - 1]
            m[i - 1][j - 1][k - 1] + 1
          else
            [m[i - 1][j][k], m[i][j - 1][k], m[i][j][k - 1]].max
          end
      end
    end
  end

  m[a.length][b.length][c.length]
end

data = STDIN.read.split.map(&:to_i)
n = data[0]
a = data[1..n]
m = data[n+1]
b = data[n+2..n+1+m]
c = data[n+3+m..-1]
puts lcs3(a, b, c)
