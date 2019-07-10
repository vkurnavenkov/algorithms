# Ford-Fulkerson algorithm
#
# Input format:
# n m
# u1 v1 c1
# u2 v2 c2
# ...
# um vm cm
#
# Where, n - number of vertices, m - number of edges
#  u - source vertex, v - destination vertex, c - capacity
#

class Edge
  attr_reader :from, :to, :capacity
  attr_accessor :flow

  def initialize(from, to, capacity)
    @from = from
    @to = to
    @capacity = capacity
    @flow = 0
  end
end

class FlowGraph
  attr_reader :vertices_count

  def initialize(vertices_count)
    @vertices_count = vertices_count
    @edges = []
    @graph = Array.new(vertices_count) { [] }
  end

  def add_edge(from, to, capacity)
    forward_edge = Edge.new(from, to, capacity)
    backward_edge = Edge.new(to, from, 0)
    @edges.push(forward_edge)
    @graph[from].push(@edges.size - 1)
    @edges.push(backward_edge)
    @graph[to].push(@edges.size - 1)
  end

  def max_flow(src, dest)
    result = 0
    residual_graph = @graph
    count = 0
    while (parents = bfs(residual_graph, @edges, src, dest))
      min_cap = 1.0/0

      to_idx = dest
      while to_idx != src
        edge_idx = parents[to_idx]
        edge = @edges[edge_idx]
        min_cap = [min_cap, edge.capacity - edge.flow].min
        to_idx = edge.from
      end

      to_idx = dest
      while to_idx != src
        edge_idx = parents[to_idx]
        edge = @edges[edge_idx]
        update_flow(@edges, edge_idx, min_cap)
        to_idx = edge.from
      end

      result += min_cap
      count += 1
    end
    # puts "Iterations: #{count}"

    result
  end

  private

  def update_flow(edges, edge_idx, flow)
    edges[edge_idx].flow += flow
    edges[edge_idx ^ 1].flow -= flow
  end

  def bfs(graph, edges, src, dest)
    visited = Array.new(graph.size, false)
    parents = Array.new(graph.size)

    queue = [src]
    while !queue.empty?
      current = queue.pop
      visited[current] = true

      graph[current].each do |edge_idx|
        edge = edges[edge_idx]
        if !visited[edge.to] && edge.capacity > edge.flow
          parents[edge.to] = edge_idx
          queue.push(edge.to)
        end
      end
    end

    visited[dest] ? parents : nil
  end
end

def read_from_input
  n, m = gets.split.map(&:to_i)
  graph = FlowGraph.new(n)
  m.times do
    u, v, c = gets.split.map(&:to_i)
    graph.add_edge(u - 1, v - 1, c)
  end

  puts graph.max_flow(0, n - 1)
end

def sample_graph_1
  graph = FlowGraph.new(5)
  graph.add_edge(0, 1, 2)
  graph.add_edge(1, 4, 5)
  graph.add_edge(0, 2, 6)
  graph.add_edge(2, 3, 2)
  graph.add_edge(3, 4, 1)
  graph.add_edge(2, 1, 3)
  graph.add_edge(1, 3, 1)

  puts graph.max_flow(0, graph.vertices_count - 1) # 6
end

def sample_graph_2
  graph = FlowGraph.new(4)
  graph.add_edge(0, 1, 10_000)
  graph.add_edge(0, 2, 10_000)
  graph.add_edge(1, 2, 1)
  graph.add_edge(2, 3, 10_000)
  graph.add_edge(1, 3, 10_000)

  puts graph.max_flow(0, graph.vertices_count - 1) # 20000
end

read_from_input
# sample_graph_1
# sample_graph_2
