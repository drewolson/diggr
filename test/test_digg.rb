require 'rubygems'
require 'test/unit'
require 'need'
need { '../lib/diggr/digg' }

class TestDigg < Test::Unit::TestCase
  def test_instantiate_class
    assert_nothing_raised do
      Diggr::Digg.new
    end
  end
end
