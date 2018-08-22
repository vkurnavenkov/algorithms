def partition3(array, l_idx, r_idx)
  pivot = array[l_idx]
  lt_idx = l_idx
  gt_idx = r_idx
  i = l_idx + 1
  while i <= gt_idx
    if array[i] < pivot
      array[i], array[lt_idx] = array[lt_idx], array[i]
      i += 1
      lt_idx += 1
    elsif array[i] > pivot
      array[i], array[gt_idx] = array[gt_idx], array[i]
      gt_idx -= 1
    else # equal
      i += 1
    end
  end

  [lt_idx, gt_idx]
end

def partition2(a, l, r)
  x = a[l]
  j = l
  (l + 1..r).each do |i|
    if a[i] <= x
      j += 1
      a[i], a[j] = a[j], a[i]
    end
  end
  a[l], a[j] = a[j], a[l]
  j
end

def randomized_quick_sort(a, l, r)
  return nil if l >= r

  k = rand(l..r)
  a[l], a[k] = a[k], a[l]
  # use partition3
  lt_idx, gt_idx = partition3(a, l, r)
  randomized_quick_sort(a, l, lt_idx - 1);
  randomized_quick_sort(a, gt_idx + 1, r);
end

if __FILE__ == $0
  n, *a = STDIN.read.split.map(&:to_i)
  randomized_quick_sort(a, 0, n - 1)
  puts "#{a.join(' ')}"
end
