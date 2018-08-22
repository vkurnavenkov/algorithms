#!/usr/bin/env ruby

def binary_search(x, a)
  return -1 if a.empty?

  l_idx = 0
  r_idx = a.size - 1

  while l_idx <= r_idx
    idx = (r_idx + l_idx) / 2
    return idx if x == a[idx]

    if x < a[idx]
      r_idx = idx - 1
    else
      l_idx = idx + 1
    end
  end
  -1
end

# a = [1, 5, 8, 12, 13]
# x = 23
# print(binary_search(x, a))

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data[0]
  a = data[1..n]
  m = data[n+1]
  data[n+2, m].each { |b| print("#{binary_search(b, a)} ") }
  puts ""
end
