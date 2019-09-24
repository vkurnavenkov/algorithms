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
      @edges[v1] << v2
    end

    @visited = Array.new(@num_vertices, false)
  end

  def toposort(vertix, edges, visited, ordered_vertices)
    visited[vertix - 1] = true
    edges[vertix].each do |v|
      toposort(v, edges, visited, ordered_vertices) unless visited[v - 1]
    end
    ordered_vertices.push(vertix)
  end

  def components_count
    visited = Array.new(@num_vertices, false)
    ordered_vertices = []

    @num_vertices.times.to_a.each do |v_idx|
      toposort(v_idx + 1, @edges, visited, ordered_vertices) unless visited[v_idx]
    end

    reversed_edges = reverse_edges
    visited.fill(false)

    result = 0
    until ordered_vertices.empty?
      v = ordered_vertices.pop
      next if visited[v - 1]
      result += 1
      toposort(v, reversed_edges, visited, [])
    end

    result
  end

  private

  def reverse_edges
    rev_edges = Hash.new { |h, k| h[k] = [] }
    @edges.each do |src_v, verts|
      verts.each do |dst_v|
        rev_edges[dst_v].push(src_v)
      end
    end
    rev_edges
  end

end

graph = Graph.new
graph.read_from_stdin

puts graph.components_count
