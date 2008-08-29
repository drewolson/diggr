require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/photo' }

class TestPhoto < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Photo.new
    end
  end

  def test_new_from_parsed_json
    parsed_json_data = {
      'id' => '1',
      'submit_date' => '12345',
      'comments' => '5',
      'title' => 'Test Photo',
      'user' => {
        'name' => 'johndoe',
        'icon' => 'http://www.gravitar.com',
        'registered' => '1234567',
        'profileviews' => '13',
      },
      'src' => 'http://www.digg.com/some/stuff/here',
      'href' => 'http://www.digg.com/more/stuff/here'
    }

    photo = Diggr::Photo.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      if key == 'user'
        assert_instance_of Diggr::User, photo.user
      else
        assert_equal val, photo.send(key)
      end
    end 
  end
end
