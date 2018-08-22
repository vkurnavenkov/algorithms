Node = Struct.new(:key, :value, :next, :prev)

class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @capacity = capacity
        @size = 0
        @data = {}
        @head = nil
        @tail = nil
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        return -1 unless @data[key]
        node = @data[key]
        extract(node)
        add_to_head(node)
        node.value
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if @data[key]
            node = @data[key]
            extract(node)
            add_to_head(node)
        else
            if @capacity <= @size
                @data.delete(@tail.key)
                extract(@tail)
                @size -= 1
            end
            node = Node.new(key, value)
            @data[key] = add_to_head(node)
            @size += 1
        end
        node.value = value
    end

    private

    def extract(node)
        return nil unless node
        if node.next
            node.next.prev = node.prev
        else
            @tail = node.prev
        end
        if node.prev
            node.prev.next = node.next
        else
            @head = node.next
        end
        # puts "extracted #{node.value}"
        @head
    end

    def add_to_head(node)
        return nil unless node
        node.next = @head
        node.prev = nil
        if @head
            @head.prev = node
        else
            @tail = node
        end
        # puts "added #{node.value}"
        @head = node
    end

end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)

LRUCache cache = new LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
