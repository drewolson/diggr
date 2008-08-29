require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/user' }

class TestUser < Test::Unit::TestCase
  def test_instantiated
    assert_nothing_raised do
      Diggr::User.new
    end
  end
  
  def test_new_from_parsed_json
    parsed_json_data = {
      'name' => 'johndoe',
      'icon' => 'http://www.gravitar.com',
      'registered' => '1234567',
      'profileviews' => '13',
    }

    user = Diggr::User.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, user.send(key)
    end
  end
end
