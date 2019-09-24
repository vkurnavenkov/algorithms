#
# Partition a given set of points into subsets (or clusters) in such a way
# that any two points from the same subset are close (or similar) to each other
#

require 'set'

Point = Struct.new(:x, :y)

class Clustering
  attr_reader :points

  def initialize
    @points = []
  end

  def add_point(x, y)
    points.push(Point.new(x, y))
  end

  def clustering(segments)
    return 0 if segments < 2

    size = points.size
    inf = 1.0/0
    costs = Array.new(size, inf)
    parents = Array.new(size, nil)
    vertices = Set.new(0..size -1)
    costs[0] = 0
    dists = []
    until vertices.empty?
      idx = find_min_index(costs, vertices)
      point = points[idx]
      dists.push(costs[idx])
      vertices.delete(idx)
      vertices.to_a.each do |p_idx|
        p = points[p_idx]
        dist = distance(point, p)
        if dist < costs[p_idx]
          costs[p_idx] = dist
        end
      end
    end
    dists.sort { |a, b| b <=> a }[segments - 2]
  end

  private

  def find_min_index(costs, vertices)
    min_value = 1.0/0
    result = nil
    costs.each_with_index do |v, idx|
      if vertices.include?(idx) && v < min_value
        min_value = v
        result = idx
      end
    end
    result
  end

  def distance(p1, p2)
    Math.sqrt((p1.x - p2.x)**2 + (p1.y - p2.y)**2)
  end
end

alg = Clustering.new
alg.add_point(7, 6)
alg.add_point(4, 3)
alg.add_point(5, 1)
alg.add_point(1, 7)
alg.add_point(2, 7)
alg.add_point(5, 7)
alg.add_point(3, 3)
alg.add_point(7, 8)
alg.add_point(2, 8)
alg.add_point(4, 4)
alg.add_point(6, 7)
alg.add_point(2, 6)
puts alg.clustering(3) # 2.828427124746

alg = Clustering.new
alg.add_point(3, 1)
alg.add_point(1, 2)
alg.add_point(4, 6)
alg.add_point(9, 8)
alg.add_point(9, 9)
alg.add_point(8, 9)
alg.add_point(3, 11)
alg.add_point(4, 12)
puts alg.clustering(4) # 5.0

vertices_count = STDIN.gets.to_i
alg = Clustering.new
vertices_count.times do
  x, y = STDIN.readline.split.map(&:to_i)
  alg.add_point(x, y)
end
segments_count = STDIN.gets.to_i
puts alg.clustering(segments_count)
