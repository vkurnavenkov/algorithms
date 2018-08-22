require 'test/unit'

class Foo

  def available?
    status == 1
  end

  private

  def status
    rand(1)
  end
end

class FooTest < Test::Unit::TestCase
  def setup
    @foo = Foo.new
  end

  def test_available_with_status_1
    def @foo.status () 1 end
    assert(@foo.available?)
  end

  def test_available_with_status_0
    def @foo.status () 0 end
    assert(!@foo.available?)
  end
end
