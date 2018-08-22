Point = Struct.new(:x, :y)

def distance(p1, p2)
  Math.sqrt((p1.x - p2.x)**2 + (p1.y - p2.y)**2)
end

def bruteforce_min_distance(points)
  rv = Float::MAX
  for i in (0..points.size-2)
    for j in (i+1..points.size-1)
      rv = [rv, distance(points[i], points[j])].min
    end
  end
  rv
end

def strip_closest(points, d, mid_line)
  min = d
  strip = points.select { |p| (p.x - mid_line).abs < min }.sort{ |p1, p2| p1.y <=> p2.y }

  strip.each.with_index do |p, i|
    j = i + 1
    while j < strip.size && (strip[j].y - p.y) < min
      min = [min, distance(strip[j], p)].min
      j += 1
    end
  end

  min
end

def minimum_distance(points)
  return bruteforce_min_distance(points) if points.size <= 3

  idx = points.size / 2
  left = points[0..idx]
  right = points[idx+1..points.size-1]
  d1 = minimum_distance(left)
  d2 = minimum_distance(right)
  d = [d1, d2].min
  mid_line = (left[-1].x + right[0].x) / 2
  d3 = strip_closest(points, d, mid_line)

  [d, d3].min
end

if __FILE__ == $0
  data = STDIN.read.split.map(&:to_i)
  n = data.shift
  points = data.each_slice(2).map { |x, y| Point.new(x, y) }.sort{ |p1, p2| p1.x <=> p2.x }

  puts "#{'%.6f' % minimum_distance(points)}"
end
