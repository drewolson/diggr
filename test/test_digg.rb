require 'rubygems'
require 'test/unit'
require 'need'
need { '../lib/diggr/digg' }
need { '../lib/diggr/request' }
need { '../lib/diggr/constants' }

class TestDigg < Test::Unit::TestCase
  def test_instantiate_class
    assert_nothing_raised do
      Diggr::Digg.new
    end
  end

  def test_valid_root_method_returns_a_request_instance
    digg = Diggr::Digg.new

    Diggr::Constants::VALID_ROOT_METHODS.each do |method|
      assert_instance_of Diggr::Request, digg.send(method)
    end
  end

  def test_invalid_root_method_throws_error
    digg = Diggr::Digg.new

    assert_raises NoMethodError do
      digg.foo
    end
  end
end
