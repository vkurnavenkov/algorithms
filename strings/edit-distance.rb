def print_distances(distances, str1, str2)
  str1_array = [' '] + str1.chars
  str2_array = [' ', ' '] + str2.chars
  puts str2_array.join(' ')
  distances.each.with_index do |row, idx|
    puts ([str1_array[idx]] + row).join(' ')
  end
end

def edit_distance(str1, str2)
  distances = Array.new(str1.length + 1) { Array.new(str2.length + 1, 0) }

  # print_distances(distances, str1, str2)

  for i in (0..str1.length)
    distances[i][0] = i
  end

  for j in (0..str2.length)
    distances[0][j] = j
  end

  for i in (1..str1.length)
    for j in (1..str2.length)
      insertions_count = distances[i][j - 1] + 1
      deletions_count = distances[i - 1][j] + 1
      mismatches_count = distances[i - 1][j - 1] + 1
      matches_count = distances[i - 1][j - 1]
      distances[i][j] = [insertions_count, deletions_count, (str1[i - 1] == str2[j - 1] ? matches_count : mismatches_count)].min
    end
  end

  # print_distances(distances, str1, str2)
  distances[str1.length][str2.length]
end

str1, str2 = gets.chomp, gets.chomp
puts edit_distance(str1, str2)
