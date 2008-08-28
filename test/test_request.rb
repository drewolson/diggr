require 'rubygems'
require 'test/unit'
require 'need'
need { '../lib/diggr/request' }
need { '../lib/diggr/constants' }

class TestRequest < Test::Unit::TestCase
  def test_request_instantiation
    assert_nothing_raised do
      Diggr::Request.new
    end
  end

  def test_simple_end_point
    request = Diggr::Request.new
    request.media

    assert_equal '/media', request.send(:instance_variable_get,"@end_point")
  end

  def test_simple_end_point_with_args
    request = Diggr::Request.new
    request.error('123')

    assert_equal '/error/123', request.send(:instance_variable_get,"@end_point")
  end

  def test_complex_end_point
    request = Diggr::Request.new
    request.stories.popular

    assert_equal '/stories/popular', request.send(:instance_variable_get,"@end_point")
  end

  def test_complex_end_point_with_args
    request = Diggr::Request.new
    request.stories.topic("technology").hot

    assert_equal '/stories/topic/technology/hot', request.send(:instance_variable_get,"@end_point")
  end

  def test_request_with_options
    request = Diggr::Request.new
    request.topics.options(:count => 5, :offset => 3)

    assert_equal '&count=5&offset=3', request.send(:instance_variable_get,"@options")
  end

  def test_cleanse_string_with_forward_slash
    request = Diggr::Request.new

    assert_equal '%2F', request.send(:cleanse,"/")
  end

  def test_cleanse_number
    request = Diggr::Request.new

    assert_equal 2, request.send(:cleanse,2)
  end
end
