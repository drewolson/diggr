require 'rubygems'
require 'test/unit'
require 'mocha'
require 'need'
need { '../lib/diggr/request' }
need { '../lib/diggr/constants' }
need { '../lib/diggr/response_classes/story' }
need { '../lib/diggr/constants' }
need { '../lib/diggr/json_parser' }

class TestRequest < Test::Unit::TestCase
  def test_request_instantiation
    assert_nothing_raised do
      Diggr::Request.new(Diggr::Constants::APP_KEY)
    end
  end

  def test_simple_end_point
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.media

    assert_equal '/media', request.send(:instance_variable_get,"@end_point")
  end

  def test_simple_end_point_with_args
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.error('123')

    assert_equal '/error/123', request.send(:instance_variable_get,"@end_point")
  end

  def test_complex_end_point
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stories.popular

    assert_equal '/stories/popular', request.send(:instance_variable_get,"@end_point")
  end

  def test_complex_end_point_with_args
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stories.topic("technology").hot

    assert_equal '/stories/topic/technology/hot', request.send(:instance_variable_get,"@end_point")
  end

  def test_request_with_options
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.topics.options(:count => 5, :offset => 3)

    assert_equal '&count=5&offset=3', request.send(:instance_variable_get,"@options")
  end

  def test_cleanse_string_with_forward_slash
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)

    assert_equal '%2F', request.send(:cleanse,"/")
  end

  def test_cleanse_number
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)

    assert_equal 2, request.send(:cleanse,2)
  end

  def test_simple_path
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stories

    assert_equal '/stories?appkey=http%3A%2F%2Fdiggr.rubyforge.org', request.send(:path)
  end

  def test_simple_path_with_options
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stories.options(:count => 3)

    assert_equal '/stories?appkey=http%3A%2F%2Fdiggr.rubyforge.org&count=3', request.send(:path)
  end

  def test_complex_path
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.story(1).diggs

    assert_equal '/story/1/diggs?appkey=http%3A%2F%2Fdiggr.rubyforge.org', request.send(:path)
  end

  def test_comma_seperated_args_product_correct_endpoint
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stories(1,2,3,4)

    assert_equal '/stories/1,2,3,4', request.send(:instance_variable_get,"@end_point")
  end

  def test_fetch
    story = Diggr::Story.new
    Diggr::JSONParser.any_instance.stubs(:parse).with(story).returns(story) 
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stubs(:make_request).returns(story)

    assert_equal story, request.fetch 
  end

  def test_each
    stories = [Diggr::Story.new,Diggr::Story.new]
    Diggr::JSONParser.any_instance.stubs(:parse).with(stories).returns(stories) 
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stubs(:make_request).returns(stories)

    request.each do |item|
      assert_instance_of Diggr::Story, item
    end
  end

  def test_each_with_singular_response
    story = Diggr::Story.new
    Diggr::JSONParser.any_instance.stubs(:parse).with(story).returns(story) 
    request = Diggr::Request.new(Diggr::Constants::APP_KEY)
    request.stubs(:make_request).returns(story)

    request.each do |item|
      assert_instance_of Diggr::Story, item
    end
  end
end
