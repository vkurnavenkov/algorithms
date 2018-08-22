require 'test/unit'

def factors_of_number_naive(n)
  result = [1]
  (2..n.div(2)).each do |v|
    result.push(v) if n % v == 0
  end
  result.push(n)

  result
end

class TestFactors < Test::Unit::TestCase
  def test_number_12
    assert_equal([1, 2, 3, 4, 6, 12], factors_of_number_naive(12))
  end

  def test_number_9
    assert_equal([1, 3, 9], factors_of_number_naive(9))
  end

  def test_number_7
    assert_equal([1, 7], factors_of_number_naive(7))
  end
end
