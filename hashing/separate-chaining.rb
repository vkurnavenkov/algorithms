class HashMap
  CAPACITY = 10
  attr_reader :size

  def initialize
    @capacity = CAPACITY
    @size = 0
    @data = Array.new(@capacity) { Array.new }
  end

  def add(key, value)
    idx, pair_idx = find_in_chain(key)
    if pair_idx
      @data[idx][pair_idx][-1] = value
    else
      @data[idx].push([key, value])
      @size += 1
    end
    value
  end

  def delete(key)
    idx, pair_idx = find_in_chain(key)
    value = nil
    if pair_idx
      value = @data[idx][pair_idx].last
      @data[idx].delete_at(pair_idx)
      @size -= 1
    end
    value
  end

  def key?(key)
    _, pair_idx = find_in_chain(key)
    pair_idx != nil
  end

  def find(key)
    idx, pair_idx = find_in_chain(key)
    pair_idx && @data[idx][pair_idx].last
  end

  def to_s
    output = ''
    @data.each do |chain|
      chain.each do |(k, v)|
        output += "#{k} => #{v}\n"
      end
    end
    output
  end

  private

  def hash_func(key)
    key.hash.abs % @capacity
  end

  def find_in_chain(key)
    idx = hash_func(key)
    pair_idx = @data[idx].find_index { |pair| pair.first == key }
    [idx, pair_idx]
  end
end

hash = HashMap.new
puts hash.add('key1', 'val1') # val1
puts hash.add('key2', 'val2') # val2
puts hash.key?('key1') # true
puts hash.key?('key3') # false
puts hash.find('key1') # val1
puts hash.add('key1', 'val1-1') # val1-1
puts hash.find('key1') # val1-1
puts hash.add('key3', 'val3') # val3
puts hash.delete('key2') # val2
puts hash.key?('key2') # false
puts hash.find('key2') # nil
puts hash.to_s
puts hash.size # 2
