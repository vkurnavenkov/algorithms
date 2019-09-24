#
# Prim's Algorithm
#

require 'set'

Edge = Struct.new(:dest, :weight)

class Graph
  attr_reader :adj_list

  def initialize(vertex_count)
    @adj_list = Array.new(vertex_count) { [] }
  end

  def add_edge(src, dest, weight)
    add_direct_edge(src, dest, weight)
    add_direct_edge(dest, src, weight)
  end

  private

  def add_direct_edge(src, dest, weight)
    edge = Edge.new(dest, weight)
    if adj_list[src]
      adj_list[src].push(edge)
    else
      adj_list[src] = [edge]
    end
    edge
  end
end

class Prim
  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def mst
    inf = 1.0/0
    size = graph.adj_list.size
    costs = Array.new(size, inf)
    parents = Array.new(size, nil)

    costs[0] = 0
    vertices = Set.new(0..size - 1)

    until vertices.empty?
      idx = find_min_index(costs, vertices)
      vertices.delete(idx)
      graph.adj_list[idx].each do |edge|
        next unless vertices.include?(edge.dest)

        if edge.weight < costs[edge.dest]
          costs[edge.dest] = edge.weight
          parents[edge.dest] = idx
        end
      end
    end

    parents
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
end

graph = Graph.new(9)
graph.add_edge(0, 1, 4)
graph.add_edge(0, 7, 8)
graph.add_edge(1, 2, 8)
graph.add_edge(1, 7, 11)
graph.add_edge(2, 3, 7)
graph.add_edge(2, 8, 2)
graph.add_edge(2, 5, 4)
graph.add_edge(3, 4, 9)
graph.add_edge(3, 5, 14)
graph.add_edge(4, 5, 10)
graph.add_edge(5, 6, 2)
graph.add_edge(6, 7, 1)
graph.add_edge(6, 8, 6)
graph.add_edge(7, 8, 7)

prim = Prim.new(graph)
puts prim.mst.to_a
