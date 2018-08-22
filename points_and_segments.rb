Segment = Struct.new(:x1, :x2) do
  def contains?(point)
    x1 <= point && point <= x2
  end
end

LEFT = 1
POINT = 2
RIGHT = 3

Point = Struct.new(:point, :type, :idx) do
  def left?
    type == LEFT
  end

  def right?
    type == RIGHT
  end

  def point?
    type == POINT
  end
end

def fast_count_segments(segments, points)
  counts = Array.new(points.size, 0)

  data = []
  segments.each_with_index do |segment, idx|
    data += [Point.new(segment.x1, LEFT, idx), Point.new(segment.x2, RIGHT, idx)]
  end
  points.each_with_index do |point|
    data << Point.new(point, POINT, idx)
  end

  data.sort { |a, b| a.point <=> b.point }

  count_left = 0
  data.each do |p|
    if p.left?
      count_left += 1
    elsif p.right?
      count_left -= 1
    else
      counts[p.idx] = count_left
    end
  end

  counts
end

def naive_count_segments(segments, points)
  points.map { |point| segments.count { |s| s.contains?(point) } }
end

if __FILE__ == $0
  data = STDIN.read.split().map(&:to_i)
  s, p = data[0], data[1]
  segments = data[2..2*s+1].each_slice(2).to_a.map { |e| Segment.new(e[0], e[1]) }
  points = data[2*s+2..-1]
  # replace naive with fast
  puts naive_count_segments(segments, points).join(' ')
end
