require 'set'

class WeightedGraph
  def initialize
    @adj_list = Hash.new { |h, k| h[k] = [] }
  end

  def add_edge(from_vertex, to_vertex, weight)
    @adj_list[from_vertex].push([to_vertex, weight])
  end

  def clear
    @adj_list.clear
  end

  def read_from_stdin
    clear
    vertices, edges = gets.split.map(&:to_i)
    edges.times do
      v1, v2, w = gets.split.map(&:to_i)
      add_edge(v1, v2, w)
    end
  end

  def distance(src_vertex, dst_vertex)
    distances = { src_vertex => 0 }
    completed = Set.new
    while (vertex = min_distance(distances, completed))
      completed.add(vertex)
      @adj_list[vertex].each do |v, w|
        dist = distances[vertex] + w
        cur_dist = distances[v]
        if cur_dist.nil? || dist < cur_dist
          distances[v] = dist
        end
      end
    end
    distances[dst_vertex]
  end

  private

  def min_distance(distances, completed)
    min = 1/0.0
    result = nil
    distances.keys.each do |v|
      if !completed.include?(v) && distances[v] < min
        min = distances[v]
        result = v
      end
    end
    result
  end
end

graph = WeightedGraph.new
graph.add_edge(1, 2, 1)
graph.add_edge(4, 1, 2)
graph.add_edge(2, 3, 2)
graph.add_edge(1, 3, 5)
puts graph.distance(1, 3) # 3

graph.clear
graph.add_edge(1, 2, 4)
graph.add_edge(1, 3, 2)
graph.add_edge(2, 3, 2)
graph.add_edge(3, 2, 1)
graph.add_edge(2, 4, 2)
graph.add_edge(3, 5, 4)
graph.add_edge(5, 4, 1)
graph.add_edge(2, 5, 3)
graph.add_edge(3, 4, 4)
puts graph.distance(1, 5) # 6

graph.clear
graph.add_edge(1, 2, 7)
graph.add_edge(1, 3, 5)
graph.add_edge(2, 3, 2)
puts graph.distance(3, 2) || -1 # -1
