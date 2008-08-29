require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/container' }

class TestContainer < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Container.new
    end
  end

  def test_new_from_parsed_json
    parsed_json_data = {
      'name' => 'Test Container',
      'short_name' => 'test',
      'topics' => [
        {
          'name' => 'Test Topic',
          'short_name' => 'test'
        }
      ]
    }

    container = Diggr::Container.new_from_parsed_json(parsed_json_data)
    
    parsed_json_data.each do |key,val|
      if key == 'topics'
        assert_instance_of Array, container.topics
      else
        assert_equal val, container.send(key)
      end
    end
  end
end
