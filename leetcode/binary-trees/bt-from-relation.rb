# Given a list of child->parent relationships.
# Build a binary tree out of it. All the element Ids inside the tree are unique.

require 'test/unit'

Node = Struct.new(:value, :left, :right)

class BTreeBuilder
  def initialize
    @root = nil
  end

  def build(relationships)
    hash = {}
    relationships.each do |node_val, parent_val, is_left|
      node = find_or_create_node(node_val, hash)
      if parent_val
        parent_node = find_or_create_node(parent_val, hash)
        if is_left
          parent_node.left = node
        else
          parent_node.right = node
        end
      else
        @root = node
      end
    end
    @root
  end

  private

  def find_or_create_node(value, hash)
    return hash[value] if hash.key?(value)
    hash[value] = Node.new(value)
  end
end

class BTreeBuilderTest < Test::Unit::TestCase
  def setup
    @tree = BTreeBuilder.new
    @relationships = [
      # child, parent, is_left?
      [15, 20, true],
      [19, 80, true],
      [17, 20, false],
      [16, 80, false],
      [80, 50, false],
      [50, nil, false],
      [20, 50, true]
    ]
  end

  def test_root_value
    assert_equal(50, @tree.build(@relationships).value)
  end

  def test_root_left_value
    assert_equal(20, @tree.build(@relationships).left.value)
  end

  def test_root_right_value
    assert_equal(80, @tree.build(@relationships).right.value)
  end

  def test_root_left_left_value
    assert_equal(15, @tree.build(@relationships).left.left.value)
  end

  def test_root_left_right_value
    assert_equal(17, @tree.build(@relationships).left.right.value)
  end

  def test_root_right_left_value
    assert_equal(19, @tree.build(@relationships).right.left.value)
  end

  def test_root_right_right_value
    assert_equal(16, @tree.build(@relationships).right.right.value)
  end
end
