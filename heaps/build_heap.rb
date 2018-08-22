class HeapBuilder
  def initialize
    @data = []
    @swaps = []
  end

  def read_data
    _, *@data = STDIN.read.split.map(&:to_i)
  end

  def write_response
    puts @swaps.size
    @swaps.each {|i, j| puts "#{i} #{j}"}
  end

  def build_min_heap
    @swaps = []
    (@data.size / 2).downto(0).each {|i| sift_down(i) }
  end

  def sift_down(i)
    min_idx = i
    if left_idx(i) < @data.size && @data[left_idx(i)] < @data[min_idx]
      min_idx = left_idx(i)
    end
    if right_idx(i) < @data.size && @data[right_idx(i)] < @data[min_idx]
      min_idx = right_idx(i)
    end

    if i != min_idx
      @data[i], @data[min_idx] = @data[min_idx], @data[i]
      @swaps.push([i, min_idx])
      sift_down(min_idx)
    end
  end

  private

  def left_idx(i)
    2*i+1
  end

  def right_idx(i)
    2*i+2
  end
end

builder = HeapBuilder.new
builder.read_data
builder.build_min_heap
builder.write_response
