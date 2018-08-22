class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
    @visited = []
    @num_vertices = 0
  end

  def read_from_stdin
    @num_vertices, num_edges = STDIN.readline.split.map(&:to_i)
    num_edges.times do
      v1, v2 = STDIN.readline.split.map(&:to_i)
      @edges[v1] << v2 # Directed Graph
    end

    @visited = Array.new(@num_vertices, false)
  end

  def dfs(vertix)
    @visited[vertix - 1] = true

    result =
      @edges[vertix].any? do |v|
        if @visited[v - 1] || dfs(v)
          true
        else
          false
        end
      end
    @visited[vertix - 1] = false unless result
    return result
  end

  # Check acyclicity
  def acyclic?
    @num_vertices.times.to_a.any? do |v_idx|
      next if @visited[v_idx]
      dfs(v_idx + 1)
    end
  end
end

graph = Graph.new
graph.read_from_stdin

puts graph.acyclic? ? 1 : 0
