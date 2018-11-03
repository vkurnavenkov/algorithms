# Open Addressing Linear Probing
#
class HashMap
  CAPACITY = 10
  attr_reader :size, :capacity

  def initialize
    @capacity = CAPACITY
    @size = 0
    @data = Array.new(@capacity)
  end

  def add(key, value)
    idx = find_key_index(key)
    if @data[idx]
      @data[idx][-1] = value
    else
      @data[idx] = [key, value]
      @size += 1
    end
    value
  end

  def delete(key)
    idx = find_key_index(key)
    value = nil
    if @data[idx]
      value = @data[idx].last
      @data[idx] = nil
      @size -= 1
    end
    value
  end

  def key?(key)
    idx = find_key_index(key)
    idx != nil && @data[idx] != nil
  end

  def find(key)
    idx = find_key_index(key)
    idx && @data[idx] && @data[idx].last
  end

  def to_s
    output = ''
    @data.each do |pair|
      next unless pair
      k, v = pair
      output += "#{k} => #{v}\n"
    end
    output
  end

  private

  def hash_func(key)
    key.hash.abs % @capacity
  end

  def find_key_index(key)
    idx = hash_func(key)
    while @data[idx] != nil && @data[idx].first != key
      idx = (idx + 1) % @capacity
    end
    idx
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
