# Construct the Burrows–Wheeler Transform of a String
#
# Naive implementation - time limit exceeded
def reconstruct_from_bwt_naive(bwt)
  result = Array.new(bwt.size) { [] }
  last = bwt.chars
  last.size.times do
    last.size.times { |i| result[i].unshift(last[i]) }
    result.sort!
  end
  result[0].rotate.join
end

def reconstruct_from_bwt(bwt)
  bwt_arr = bwt.chars
  map = Hash.new { |h, k| h[k] = [] }
  # Store { char: [positions] }
  for i in 0..bwt_arr.size - 1
    map[bwt_arr[i]].push(i)
  end
  l_index = Array.new(bwt_arr.size)
  bwt_sorted = bwt_arr.sort
  for i in 0..bwt_sorted.size - 1
    l_index[i]= map[bwt_sorted[i]].shift
  end

  result = []
  idx = l_index[0]
  while idx != 0
    idx = l_index[idx]
    result.push(bwt_arr[idx])
  end
  result.push('$')

  result.join
end

bwt = gets.chomp
puts reconstruct_from_bwt(bwt)
