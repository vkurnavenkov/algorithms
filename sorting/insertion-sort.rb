def insertion_sort(arr)
  return arr if arr.size <= 1
  arr.each.with_index do |val, idx|
    j = idx - 1
    while j >= 0 && arr[j] > val
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = val
  end

  arr
end

def insertion_sort_recursive(arr, n = arr.size)
  return arr if n <= 1
  insertion_sort_recursive(arr, n - 1)
  val = arr[n - 1]
  j = n - 2
  while j >= 0 && arr[j] > val
    arr[j + 1] = arr[j]
    j -= 1
  end
  arr[j + 1] = val
  arr
end

puts 'insertion_sort'
puts insertion_sort([10, 11, 13, 15, 6]) == [6, 10, 11, 13, 15]
puts insertion_sort([12, 11, 13, 5, 6]) == [5, 6, 11, 12, 13]
puts insertion_sort([2, 1, 13, 5, 16, 9, 4, 0, 18, 16]) == [0, 1, 2, 4, 5, 9, 13, 16, 16, 18]

puts 'insertion_sort_recursive'
puts insertion_sort_recursive([10, 11, 13, 15, 6]) == [6, 10, 11, 13, 15]
puts insertion_sort_recursive([12, 11, 13, 5, 6]) == [5, 6, 11, 12, 13]
puts insertion_sort_recursive([2, 1, 13, 5, 16, 9, 4, 0, 18, 16]) == [0, 1, 2, 4, 5, 9, 13, 16, 16, 18]
