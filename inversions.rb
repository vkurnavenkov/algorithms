#!/usr/bin/env ruby

# Copy part of array
def copy(a, b, l, r)
  while l <= r
    b[l] = a[l]
    l += 1
  end
end

def get_number_of_inversions(a, b, left, right)
  number_of_inversions = 0
  return 0 if right == left

  mid = (right + left) / 2
  number_of_inversions += get_number_of_inversions(a, b, left, mid)
  number_of_inversions += get_number_of_inversions(a, b, mid + 1, right)
  number_of_inversions += merge(a, b, left, mid, right)

  # puts "Left: #{left}, mid: #{mid} right: #{right}, count: #{number_of_inversions}, #{b}"
  return number_of_inversions
end

def merge(a, b, left, mid, right)
  count = 0
  idx = left
  l_idx = left
  r_idx = mid + 1
  while l_idx <= mid && r_idx <= right
    if a[l_idx] > a[r_idx]
      b[idx] = a[r_idx]
      r_idx += 1
      count += mid - l_idx + 1
    else
      b[idx] = a[l_idx]
      l_idx += 1
    end
    idx += 1
  end

  # Copy remaining
  while l_idx <= mid
    b[idx] = a[l_idx]
    l_idx += 1
    idx += 1
  end

  while r_idx <= right
    b[idx] = a[r_idx]
    r_idx += 1
    idx += 1
  end

  copy(b, a, left, right)

  count
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  b = Array.new(n, 0)
  puts get_number_of_inversions(a, b, 0, n - 1)
end
