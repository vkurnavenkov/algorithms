require 'test/unit'

Node = Struct.new(:value, :left, :right)

class Tree
  def initialize(root)
    @root = root
  end

  def find(key)
    node = @root
    while node != nil
      return 1 if node.value == key
      node = node.value > key ? node.left : node = node.right
    end
    -1
  end
end


class TreeFindTest < Test::Unit::TestCase
  def setup
    root = Node.new(8, Node.new(4, Node.new(2), Node.new(6, Node.new(5))), Node.new(15, Node.new(12, Node.new(10), Node.new(14)), Node.new(18)))
    @tree = Tree.new(root)
  end

  def test_number_0
    assert_equal(-1, @tree.find(0))
  end

  def test_find_1
    assert_equal(-1, @tree.find(1))
  end

  def test_number_6
    assert_equal(1, @tree.find(6))
  end

  def test_number_10
    assert_equal(1, @tree.find(10))
  end

  def test_number_11
    assert_equal(-1, @tree.find(11))
  end

  def test_number_20
    assert_equal(-1, @tree.find(20))
  end
end
