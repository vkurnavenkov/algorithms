class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
    @num_vertices = 0
  end

  def read_from_stdin
    @num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    # @edges = Array.new(@num_vertices) { [] }
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      @edges[v1] << v2 # Directed Graph
    end
  end

  def dfs(vertix, visited, ordered_vertices)
    # puts vertix, visited.to_s, ordered_vertices.to_s
    visited[vertix - 1] = true

    @edges[vertix].each do |v|
      dfs(v, visited, ordered_vertices) unless visited[v - 1]
    end
    ordered_vertices.push(vertix)
    # puts "Result:", vertix, visited.to_s, ordered_vertices.to_s
  end

  def toposort
    visited = Array.new(@num_vertices, false)
    ordered_vertices = []
    @num_vertices.times.to_a.each do |v_idx|
      next if visited[v_idx]
      dfs(v_idx + 1, visited, ordered_vertices)
    end
    ordered_vertices.reverse
  end
end

graph = Graph.new
graph.read_from_stdin

puts graph.toposort.join(' ')
