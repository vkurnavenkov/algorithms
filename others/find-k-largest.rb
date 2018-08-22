
def find_k_largest(data, k)
  quick_select(data, k, 0, data.size - 1)
end

def quick_select(data, k, left, right)
  return nil if left > right
  return data[left] if left == right

  pivot_idx = rand(left..right)
  data[left], data[pivot_idx] = data[pivot_idx], data[left]

  pos = partition(data, left, right)
  if k == pos + 1
    return data[pos]
  elsif k < pos + 1
    quick_select(data, k, left, pos - 1)
  else
    quick_select(data, k, pos + 1, right)
  end
end

def partition(data, left, right)
  pivot = data[left]
  i = left + 1
  j = left
  while i <= right
    if data[i] < pivot
      j += 1
      data[i], data[j] = data[j], data[i]
    end
    i += 1
  end
  data[left], data[j] = data[j], data[left]
  # puts "#{data}, #{left}, #{right}, #{j}"
  j
end

# data = [7, 10, 4, 3, 20, 15]
# k = 5

data = [8, 7, 11, 17, 10, 1, 4, 6, 3, 22, 20, 15]
k = 5

puts "#{find_k_largest(data, k)}"
