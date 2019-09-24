# Longest Insreasing Subsequence
# {10, 22, 9, 33, 21, 50, 41, 60, 80}
# LIS: {10, 22, 33, 50, 60, 80} or {10, 22, 33, 41, 60, 80}
# LIS length: 6

require 'test/unit'

class Lis
  def initialize(data)
    @data = data
  end

  def lis_recur
    return 0 if @data.empty?
    _lis_recur(@data.size)
  end

  def lis_dynamic
    return 0 if @data.empty?
    lis = Array.new(@data.size, 1)
    max = 1
    (1..@data.size-1).to_a.each do |i|
      (0..i-1).to_a.each do |j|
        if @data[i] > @data[j] && lis[j] + 1 > lis[i]
          lis[i] = lis[j] + 1
          max = [lis[i], max].max
        end
      end
    end

    max
  end

  private

  def _lis_recur(n)
    return 1 if n == 1
    max = 1
    (n - 1).times do |i|
      result = _lis_recur(i + 1)
      max = result + 1 if @data[i] < @data[n - 1] && (result + 1 > max)
    end

    max
  end
end

class TestCase1 < Test::Unit::TestCase
  def setup
    @lis = Lis.new([10, 22, 9, 33, 21, 50, 41, 60, 80])
  end

  def test_lis_recur
    assert_equal(6, @lis.lis_recur)
  end

  def test_lis_dynamic
    assert_equal(6, @lis.lis_dynamic)
  end
end

class TestCase2 < Test::Unit::TestCase
  def setup
    @lis = Lis.new([50, 3, 10, 7, 40, 80])
  end

  def test_lis_recur
    assert_equal(4, @lis.lis_recur)
  end

  def test_lis_dynamic
    assert_equal(4, @lis.lis_dynamic)
  end
end

class TestCase3 < Test::Unit::TestCase
  def setup
    @lis = Lis.new([3, 10, 2, 1, 20])
  end

  def test_lis_recur
    assert_equal(3, @lis.lis_recur)
  end

  def test_lis_dynamic
    assert_equal(3, @lis.lis_dynamic)
  end
end

class TestCase4 < Test::Unit::TestCase
  def setup
    @lis = Lis.new([3, 2])
  end

  def test_lis_recur
    assert_equal(1, @lis.lis_recur)
  end

  def test_lis_dynamic
    assert_equal(1, @lis.lis_dynamic)
  end
end

class TestCase5 < Test::Unit::TestCase
  def setup
    @lis = Lis.new([])
  end

  def test_lis_recur
    assert_equal(0, @lis.lis_recur)
  end

  def test_lis_dynamic
    assert_equal(0, @lis.lis_dynamic)
  end
end
