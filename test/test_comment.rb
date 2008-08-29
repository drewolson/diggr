require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/comment' }

class TestComment < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Comment.new
    end
  end

  def test_new_from_parsed_json_data
    parsed_json_data = {
      'date' => '07292008',
      'id' => '2',
      'story' => '1',
      'up' => '2',
      'down' => '3',
      'replies' => '5',
      'replyto' => 'null',
      'user' => 'johndoe',
      'content' => 'this is a comment',
      'level' => '0',
      'root' => '0'
    }

    comment = Diggr::Comment.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      assert_equal val, comment.send(key)
    end
  end
end
