class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
    @visited = []
  end

  def read_from_stdin
    num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      @edges[v1] << v2
      @edges[v2] << v1
    end

    @visited = Array.new(num_vertices, false)
  end

  def reach(src, dest)
    return true if src == dest
    return false if @visited[src - 1]

    @visited[src - 1] = true
    @edges[src].any? do |vertix|
      reach(vertix, dest)
    end
  end
end

graph = Graph.new
graph.read_from_stdin
src, dest = STDIN.readline.split.map(&:to_i)

puts graph.reach(src, dest) ? 1 : 0
