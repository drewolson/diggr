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

    topic = Diggr::Topic.new
    topic.name = 'Test Topic'
    topic.short_name = 'test'

    container = Diggr::Container.new
    container.name = 'Test Container'
    container.short_name = 'test'
    container.topics << topic

    parsed_container = Diggr::Container.new_from_parsed_json(parsed_json_data)
    
    assert_equal Marshal.dump(container), Marshal.dump(parsed_container)
  end
end
