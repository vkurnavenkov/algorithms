Node = Struct.new(:value, :next)

class LinkedList
  def initialize
    @head = nil
  end

  def add(value)
    node = Node.new(value, @head)
    @head = node
  end

  def find(n)
    count = 0
    cur = @head
    while cur != nil
      count += 1
      cur = cur.next
    end

    return nil if n > count

    cur = @head
    (count - n).times do
      cur = cur.next
    end

    cur
  end
end

list = LinkedList.new

list.add(234)
list.add(56)
list.add(789)
list.add(3456)


puts list.find(2)

# 3456 -> 789 -> 56 -> 234 -> nil
