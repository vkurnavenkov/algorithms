# Implement the below testing framework
# expect(x).to_be_equal(y)
# expect(y).to_be_empty


class Expectation
  def initialize(obj)
    @obj = obj
  end

  def to_be_equal(value)
    @obj == value
  end

  def to(block)
    block.call(@obj)
  end
end

class BeEmpty
  def call(obj)
    if obj.respond_to?(:empty?)
      obj.empty?
    else
      obj.nil?
    end
  end
end

def expect(obj)
  Expectation.new(obj)
end

def be_equal(expection)
  expection.to_be_empty
end

def be_empty
  proc { |obj|
    if obj.respond_to?(:empty?)
      obj.empty?
    else
      obj.nil?
    end
  }
end


# puts expect("ab").to be_equal("ab")
puts expect(1234).to be_empty
puts expect(nil).to be_empty
