require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/short_url' }

class TestShortUrl < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::ShortUrl.new
    end
  end

  def test_new_from_parsed_json_data
    parsed_json_data = {
      'short_url' => 'http://digg.com/D123JKL',
      'views' => 1
    }

    digg = Diggr::ShortUrl.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, digg.send(key)
    end
  end
end
