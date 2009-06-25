require 'test/unit'
require 'rubygems'
require 'need'
need { '../lib/diggr/response_classes/story' }

class TestStory < Test::Unit::TestCase
  def test_instantiation
    assert_nothing_raised do
      Diggr::Story.new
    end
  end

  def test_new_from_parsed_json
    parsed_json_data = {
      "id" => "4368401",
      "link" => "http://maxsangalli.altervista.org/?p=45",
      "submit_date" => 1196891534,
      "diggs" => 1,
      "comments" => 0,
      "title" => "Jukebox con Linux",
      "description" => "Jukebox with Linux",
      "status" => "upcoming",
      "media" => "news",
      "user" => {
          "name" => "ilsanga",
          "icon" => "http://digg.com/img/udl.png",
          "registered" => 1196891377,
          "profileviews" => 0
       },
      "topic" => {
        "name" => "Linux/Unix",
        "short_name" => "linux_unix"
      },
      "container" => {
        "name" => "Technology",
        "short_name" => "technology"
      },
      "thumbnail" => {
        "originalwidth" => 390,
        "originalheight" => 387,
        "contentType" => "image/jpeg",
        "src" => "http://digg.com/linux_unix/Jukebox_con_Linux/t.jpg",
        "width" => 80,
        "height" => 80
      },
      "shorturl" => [{
        "short_url" => "http://digg.com/D123JKL",
        "views" => 1
      }],
      "href" => "http://digg.com/linux_unix/Jukebox_con_Linux"
    }

    photo = Diggr::Story.new_from_parsed_json(parsed_json_data)

    parsed_json_data.each do |key,val|
      unless val.kind_of? Hash or val.kind_of? Array
        assert_equal val, photo.send(key)
      end
    end 
  end
end
