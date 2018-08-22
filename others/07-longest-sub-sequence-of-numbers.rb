def longest_subsequence(str)
  arr = str.split(/,\s*/).map(&:to_i)
  arr.sort!
  long_idx1 = 0
  long_idx2 = 0
  idx = 0
  (1..arr.size - 1).each do |i|
    if arr[i] == arr[i - 1] + 1
      if i - idx > long_idx2 - long_idx1
        long_idx1, long_idx2 = idx, i
      end
    else
      idx = i
    end
  end
  arr[long_idx1 .. long_idx2].join(' ')
end

puts longest_subsequence("1, 9, 3, 10, 4, 20, 2") # 1 2 3 4
puts longest_subsequence("11, 9, 3, 10, 4, 20, 2") # 2 3 4
puts longest_subsequence("11, 7, 3, 10, 4, 20, 12") # 10 11 12
