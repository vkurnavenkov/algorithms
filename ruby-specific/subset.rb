def subset?(needles, haystack)
  return true if needles.empty?
  needles_map = {}
  needles.each do |v|
    needles_map[v] = 0 unless needles_map[v]
    needles_map[v] += 1
  end
  haystack.each do |v|
    if needles_map[v] && needles_map[v] > 0
      needles_map[v] -= 1
      needles_map.delete(v) if needles_map[v] == 0
      return true if needles_map.empty?
    end
  end
  needles_map.empty?
end
