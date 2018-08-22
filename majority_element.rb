def get_majority_element(a, left, right)
  return -1 if left > right
  return a[left] if right == left

  idx = (right + left) / 2
  l_value = get_majority_element(a, left, idx)
  r_value = get_majority_element(a, idx + 1, right)
  return l_value if l_value == r_value

  k = (right - left + 1) / 2
  l_count = a[left..right].count {|v| v == l_value}
  r_count = a[left..right].count {|v| v == r_value}
  if l_count > k
    return l_value
  elsif r_count > k
    return r_value
  end

  -1
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  answer = get_majority_element(a, 0, n - 1) != -1
  puts "#{answer ? 1 : 0}"
end
