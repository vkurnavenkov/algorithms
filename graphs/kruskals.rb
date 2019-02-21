#
# Kruskal's Algorithm
#

Edge = Struct.new(:src, :dest, :weight)

class DisjointSet
  attr_reader :parents, :ranks

  def initialize(count)
    @parents = Array.new(count)
    @parents.each_with_index { |_v, i| @parents[i] = i }
    @ranks = Array.new(count, 0)
  end

  def find_old(idx)
    until parents[idx] == idx
      idx = parents[idx]
    end
    idx
  end

  def find(idx)
    return idx if idx == parents[idx]

    parents[idx] = find(parents[idx]) # Path Compression
  end

  def union(idx1, idx2)
    parent1 = find(idx1)
    parent2 = find(idx2)
    return if parent1== parent2

    rank1 = ranks[parent1]
    rank2 = ranks[parent2]
    if rank1 < rank2
      parents[parent1] = parent2
    elsif rank1 > rank2
      parents[parent2] = parent1
    else
      parents[parent1] = parent2
      ranks[parent2] += 1
    end
  end
end

class Graph
  attr_reader :edges

  def initialize
    @edges = []
  end

  def add_edge(src, dest, weight)
    edge = Edge.new(src, dest, weight)
    edges.push(edge)
  end
end

class Kruskal
  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  def mst
    edges = graph.edges.sort { |a, b| a.weight <=> b.weight }
    subsets = DisjointSet.new(edges.size)

    result = []
    edges.each do |edge|
      idx1 = subsets.find(edge.src)
      idx2 = subsets.find(edge.dest)
      if idx1 != idx2
        subsets.union(idx1, idx2)
        result.push(edge)
      end
    end

    result
  end
end

graph = Graph.new
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

prim = Kruskal.new(graph)
puts prim.mst.to_a
