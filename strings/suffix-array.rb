# Construct the Suffix Array of a Long String
#

ALPHABET_SIZE = 26

def soft_chars(str)
  result = Array.new(str.size)
  counts = Array.new(256, 0) # Hash.new { |h, k| h[k] = 0 }
  str.each_char { |c| counts[c.ord] += 1 }
  for i in 1..counts.size - 1
    counts[i] += counts[i - 1]
  end

  j = str.size - 1
  while j >= 0
    c = str[j]
    counts[c.ord] -= 1
    result[counts[c.ord]] = j
    j -= 1
  end

  result
end

def sort_doubled(str, l, orders, classes)
  result = Array.new(str.size)
  counts = Array.new(str.size, 0)
  for i in 0..str.size - 1
    counts[classes[i]] += 1
  end
  for i in 1..counts.size - 1
    counts[i] += counts[i - 1]
  end

  n = str.size
  j = n - 1
  while j >= 0
    pos = (orders[j] - l + n) % n
    cls = classes[pos]
    counts[cls] -= 1
    result[counts[cls]] = pos
    j -= 1
  end

  result
end

def compute_char_classes(str, orders)
  result = Array.new(str.size, 0)
  for i in 1..str.size - 1
    if str[orders[i]] == str[orders[i - 1]]
      result[orders[i]] = result[orders[i - 1]]
    else
      result[orders[i]] = result[orders[i - 1]] + 1
    end
  end
  result
end

def update_classes(orders, classes, l)
  n = orders.size
  result = Array.new(orders.size, 0)
  for i in 1..orders.size - 1
    cur = orders[i]
    prev = orders[i - 1]
    mid = (cur + l) % n
    mid_prev = (prev + l) % n
    if classes[cur] == classes[prev] && classes[mid] == classes[mid_prev]
      result[cur] = result[prev]
    else
      result[cur] = result[prev] + 1
    end
  end
  result
end

def build_suffix_array(str)
  n = str.size
  orders = soft_chars(str)
  classes = compute_char_classes(str, orders)
  l = 1
  while l < n
    orders = sort_doubled(str, l, orders, classes)
    classes = update_classes(orders, classes, l)
    l *= 2
  end
  orders
end

str = gets.chomp
puts build_suffix_array(str).join(' ')
