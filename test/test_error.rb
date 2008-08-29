require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/error' }

class TestError < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Error.new
    end
  end

  def test_new_from_parsed_json
    parsed_json_data = {
      'code' => '1234',
      'message' => 'test',
    }

    error = Diggr::Error.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, error.send(key)
    end
  end
end
