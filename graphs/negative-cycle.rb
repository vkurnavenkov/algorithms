# Detecting Anomalies in Currency Exchange Rates
# Based on Bellman-Ford Algorithm

class WeightedGraph
  INF = 1.0/0

  def initialize(vertices = nil)
    init_adj_list(vertices) if vertices
  end

  def add_edge(from_vertex, to_vertex, weight)
    @adj_list[from_vertex - 1].push(to_vertex - 1)
    @costs[from_vertex - 1].push(weight)
  end

  def read_from_stdin
    vertices, edges = gets.split.map(&:to_i)
    init_adj_list(vertices)
    edges.times do
      v1, v2, w = gets.split.map(&:to_i)
      add_edge(v1, v2, w)
    end
  end

  def negative_cycle?
    dists = Array.new(@adj_list.size, INF)
    dists[0] = 0
    prevs = Array.new(@adj_list.size)

    # Vertex Count - 1 iterations to find shortest path
    # + One more iteration to detect negative cycle
    (0..@adj_list.size - 1).each do |i|
      @adj_list.size.times do |u|
        @adj_list[u].each_with_index do |v, v_idx|
          new_dist = dists[u] + @costs[u][v_idx]
          if new_dist < dists[v]
            return true if i == @adj_list.size - 1
            dists[v] = new_dist
          end
        end
      end
    end

    false
  end

  private

  def init_adj_list(vertices)
    @adj_list = Array.new(vertices) { [] }
    @costs = Array.new(vertices) { [] }
  end
end

graph = WeightedGraph.new(4)
graph.add_edge(1, 2, -5)
graph.add_edge(4, 1, 2)
graph.add_edge(2, 3, 2)
graph.add_edge(3, 1, 1)
puts graph.negative_cycle? ? 1 : 0 # 1

graph = WeightedGraph.new(4)
graph.add_edge(1, 2, -2)
graph.add_edge(4, 1, 2)
graph.add_edge(2, 3, 2)
graph.add_edge(3, 1, 1)
puts graph.negative_cycle? ? 1 : 0 # 0

# Reading from STDIN
graph = WeightedGraph.new
graph.read_from_stdin
puts graph.negative_cycle? ? 1 : 0
