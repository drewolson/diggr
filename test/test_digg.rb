require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/digg' }

class TestDigg < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Digg.new
    end
  end

  def test_new_from_parsed_json_data
    parsed_json_data = {
      'date' => '07292008',
      'story' => '1',
      'id' => '2',
      'user' => 'johndoe',
      'status' => 'popular'
    }

    digg = Diggr::Digg.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, digg.send(key)
    end
  end
end
