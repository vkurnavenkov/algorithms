Table = Struct.new(:parent, :num_rows, :rank)
Query = Struct.new(:dest, :src)

class DisjointSets
  def initialize(tables)
    @tables = tables
  end

  def merge(dest, src)
    dest_parent = get_parent(dest)
    src_parent = get_parent(src)
    return max_num_rows if dest_parent == src_parent

    if @tables[dest_parent].rank > @tables[src_parent].rank
      @tables[src_parent].parent = dest_parent
      @tables[dest_parent].num_rows += @tables[src_parent].num_rows
      @tables[src_parent].num_rows = 0
    else
      @tables[dest_parent].parent = src_parent
      @tables[src_parent].num_rows += @tables[dest_parent].num_rows
      @tables[dest_parent].num_rows = 0
      @tables[src_parent].rank += 1 if @tables[dest_parent].rank == @tables[src_parent].rank
    end
    max_num_rows
  end

  private

  def max_num_rows
    @tables.map { |t| t.num_rows }.max
  end

  def get_parent(idx)
    while idx != @tables[idx].parent
      idx = @tables[idx].parent
    end
    idx
  end

  # path compression
  # def get_parent(idx)
  #   if idx != @tables[idx].parent
  #     @tables[idx].parent = get_parent(@tables[idx].parent)
  #   end
  #   @tables[idx].parent
  # end
end

num_tables, num_queries, *raw_data = STDIN.read.chomp.split.map(&:to_i)

# num_tables = 5
# num_queries = 5
# raw_data = [1, 1, 1, 1, 1, 3, 5, 2, 4, 1, 4, 5, 4, 5, 3]

tables = num_tables.times.map do |idx|
  Table.new(idx, raw_data[idx], 0)
end
queries = raw_data[num_tables..-1].each_slice(2).map { |dest, src| Query.new(dest, src) }

sets = DisjointSets.new(tables)
queries.each do |q|
  puts sets.merge(q.dest - 1, q.src - 1)
end
