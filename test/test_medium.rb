require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/medium' }

class TestMedium < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Medium.new
    end
  end

  def test_new_from_parsed_json_data
    parsed_json_data = {
      'name' => 'Test Name',
      'short_name' => 'test'
    }

    digg = Diggr::Medium.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, digg.send(key)
    end
  end
end
