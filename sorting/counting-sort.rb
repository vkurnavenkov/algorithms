# Allowed set is characters a..z

def counting_sort(arr)
  return arr if arr.size <= 1
  counts = Array.new(26, 0)
  arr.each { |c| counts[c.ord - 'a'.ord] += 1 }
  sum = 0
  counts.each.with_index do |cnt, i|
    sum += cnt
    counts[i] = sum
  end
  result = Array.new(arr.size)
  arr.each.with_index do |val, i|
    cnt = counts[val.ord - 'a'.ord]
    result[cnt - 1] = val
    counts[val.ord - 'a'.ord] -= 1
  end
  result
end

puts counting_sort(['a']) == ['a']
puts counting_sort(['n', 'a', 'd']) == ['a', 'd', 'n']
puts counting_sort(['n', 'a', 'd', 'e', 'b']) == ['a', 'b', 'd', 'e', 'n']
puts counting_sort(['n', 'k', 'j', 'e', 'b', 'a', 'd']) == ['a', 'b', 'd', 'e', 'j', 'k', 'n']
