require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/json_parser' }
need { '../lib/diggr/response_classes/topic' }

class TestJSONParser < Test::Unit::TestCase
  def test_find_class
    parser = Diggr::JSONParser.new

    assert_equal Diggr::Topic, parser.send(:find_class, 'topics')
  end
end
