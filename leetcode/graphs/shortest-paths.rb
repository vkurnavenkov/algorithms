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

  def shortest_paths(src_vertex)
    vertex = src_vertex - 1
    distance = Array.new(@adj_list.size, INF)
    reachable = Array.new(@adj_list.size, false)
    distance[vertex] = 0
    reachable[vertex] = true
    queue = []

    # Vertex Count - 1 iterations to find shortest path
    # + One more iteration to detect negative cycle
    (0..@adj_list.size - 1).each do |i|
      @adj_list.size.times do |u|
        @adj_list[u].each_with_index do |v, v_idx|
          new_dist = distance[u] + @costs[u][v_idx]
          if new_dist < distance[v]
            distance[v] = new_dist
            reachable[v] = true
            queue.push(v) if i == @adj_list.size - 1
          end
        end
      end
    end

    # there is a path from s to u
    # but there is no shortest path from s to u (that is, the distance from s to u is −∞)
    shortest = Array.new(@adj_list.size, true)
    visited = Array.new(@adj_list.size, false)
    until queue.empty? do
      u = queue.shift
      visited[u] = true
      shortest[u] = false
      @adj_list[u].each do |v|
        unless visited[v]
          queue.push(v)
          visited[v] = true
          shortest[v] = false
        end
      end
    end

    distance[vertex] = 0
    shortest[vertex] = true

    results = []
    @adj_list.size.times do |i|
      if !reachable[i]
        results.push('*')
      elsif !shortest[i]
        results.push('-')
      else
        results.push(distance[i])
      end
    end

    results
  end

  private

  def init_adj_list(vertices)
    @adj_list = Array.new(vertices) { [] }
    @costs = Array.new(vertices) { [] }
  end
end

graph = WeightedGraph.new(6)
graph.add_edge(1, 2, 10)
graph.add_edge(2, 3, 5)
graph.add_edge(1, 3, 100)
graph.add_edge(3, 5, 7)
graph.add_edge(5, 4, 10)
graph.add_edge(4, 3, -18)
graph.add_edge(6, 1, -1)
puts "---"
puts graph.shortest_paths(1) # 0 10  - - - *

graph = WeightedGraph.new(5)
graph.add_edge(1, 2, 1)
graph.add_edge(4, 1, 2)
graph.add_edge(2, 3, 2)
graph.add_edge(3, 1, -5)
puts "---"
puts graph.shortest_paths(4) # - - - 0 *
