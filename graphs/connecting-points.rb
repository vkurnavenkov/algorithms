#
# Building Roads to Connect Cities
#

require 'set'

Point = Struct.new(:x, :y)

class ConnectingPoints
  attr_reader :points

  def initialize
    @points = []
  end

  def add_point(x, y)
    points.push(Point.new(x, y))
  end

  def min_distance
    size = points.size
    inf = 1.0/0
    costs = Array.new(size, inf)
    parents = Array.new(size, nil)
    vertices = Set.new(0..size -1)
    costs[0] = 0
    result = 0
    until vertices.empty?
      idx = find_min_index(costs, vertices)
      point = points[idx]
      result += costs[idx]
      vertices.delete(idx)
      vertices.to_a.each do |p_idx|
        p = points[p_idx]
        dist = distance(point, p)
        if dist < costs[p_idx]
          costs[p_idx] = dist
        end
      end
    end
    result
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

alg = ConnectingPoints.new
alg.add_point(0, 0)
alg.add_point(0, 1)
alg.add_point(1, 0)
alg.add_point(1, 1)
puts alg.min_distance # 3.0

alg = ConnectingPoints.new
alg.add_point(0, 0)
alg.add_point(0, 2)
alg.add_point(1, 1)
alg.add_point(3, 0)
alg.add_point(3, 2)
puts alg.min_distance # 7.0644951022

vertices_count = STDIN.gets.to_i
alg = ConnectingPoints.new
vertices_count.times do
  x, y = STDIN.readline.split.map(&:to_i)
  alg.add_point(x, y)
end
puts alg.min_distance
