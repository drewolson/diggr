require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/topic' }
need { '../lib/diggr/response_classes/container' }

class TestTopic < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Topic.new
    end
  end

  def test_new_from_parsed_json
    parsed_json_data = {
      'name' => 'Test Topic',
      'short_name' => 'test',
      'container' => {
        'name' => 'Test Container',
        'short_name' => 'test'
      }
    }

    container = Diggr::Container.new
    container.name = 'Test Container'
    container.short_name = 'test'

    topic = Diggr::Topic.new
    topic.name = 'Test Topic'
    topic.short_name = 'test'
    topic.container = container

    parsed_topic = Diggr::Topic.new_from_parsed_json(parsed_json_data)
    
    assert_equal Marshal.dump(topic), Marshal.dump(parsed_topic)
  end
end
