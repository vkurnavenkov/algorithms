# Check whether the given number is present as sum of 2 numbers
# Assuming not distinct numbers

require 'test/unit'

class Checker
  def initialize
    @data = Hash.new { |h, k| h[k] = 0 }
  end

  def store(n)
    @data[n] += 1
  end

  def exist?(n)
    @data.keys.any? do |v|
      @data.key?(n - v) && (v != n - v || @data[v] > 1)
    end
  end
end

class TestChecker < Test::Unit::TestCase
  def setup
    @checker = ::Checker.new
    @checker.store(1)
    @checker.store(3)
    @checker.store(5)
    @checker.store(6)
  end

  def test_number_4
    assert(@checker.exist?(4))
  end

  def test_number_5
    assert(!@checker.exist?(5))
  end

  def test_number_6
    assert(@checker.exist?(6))
  end

  def test_number_7
    assert(@checker.exist?(7))
  end

  def test_number_8
    assert(@checker.exist?(8))
  end

  def test_number_9
    assert(@checker.exist?(9))
  end

  def test_number_10
    assert(!@checker.exist?(10))
  end

  def test_number_11
    assert(@checker.exist?(11))
  end
end
