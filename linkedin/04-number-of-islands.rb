class Graph
  # edges as adj matrix
  def initialize(edges)
    @edges = edges
  end

  def components_count
    visited = Array.new(row_count) { Array.new(col_count, false) }
    result = 0
    @edges.each.with_index do |row, row_idx|
      row.each.with_index do |val, col_idx|
        next if val == 0 || visited[row_idx][col_idx]
        dfs(row_idx, col_idx, visited)
        result += 1
      end
    end

    result
  end

  def row_count
    @row_count ||= @edges.size
  end

  def col_count
    @col_count ||= @edges[0].size
  end

  private

  def dfs(row_idx, col_idx, visited)
    visited[row_idx][col_idx] = true

    d_row = [-1, 0, 0, 1]
    d_col = [0, -1, 1, 0]
    d_row.size.times do |idx|
      new_row_idx = row_idx + d_row[idx]
      new_col_idx = col_idx + d_col[idx]
      next if !point_inside?(new_row_idx, new_col_idx) ||
        visited[new_row_idx][new_col_idx] || @edges[new_row_idx][new_col_idx] == 0
      dfs(new_row_idx, new_col_idx, visited)
    end
  end

  def point_inside?(row_idx, col_idx)
    row_idx >=0 && row_idx < row_count &&
      col_idx >=0 && col_idx < col_count
  end
end

matrix = [
  [1, 1, 0, 0, 0],
  [0, 1, 0, 0, 1],
  [1, 0, 0, 1, 1],
  [0, 0, 0, 0, 0],
  [1, 0, 1, 0, 1]
]
graph = Graph.new(matrix)
puts graph.components_count # 6

matrix2 = [
  [0, 0, 1, 0, 1],
  [0, 1, 1, 0, 1],
  [0, 0, 0, 1, 1],
  [0, 0, 1, 1, 0]
]
graph2 = Graph.new(matrix2)
puts graph2.components_count # 2
