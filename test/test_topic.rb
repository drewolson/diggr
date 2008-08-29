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

    topic = Diggr::Topic.new_from_parsed_json(parsed_json_data)
    
    parsed_json_data.each do |key,val|
      if key == 'container'
        assert_instance_of Diggr::Container, topic.container
      else
        assert_equal val, topic.send(key)
      end
    end
  end
end
