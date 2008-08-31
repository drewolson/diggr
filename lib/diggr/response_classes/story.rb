require 'rubygems'
require 'need'
need { 'user' }
need { 'topic' }
need { 'container' }
need { 'photo' }

module Diggr
  class Story
    attr_accessor :id, :link, :submit_date, :diggs, :comments, :title, :description,
      :status, :media, :user, :topic, :container, :thumbnail, :href

    def self.new_from_parsed_json(data)
      story = Story.new

      story.id = data['id'] if data['id']
      story.link = data['link'] if data['link']
      story.submit_date = data['submit_date'] if data['submit_date']
      story.diggs = data['diggs'] if data['diggs']
      story.comments = data['comments'] if data['comments']
      story.title = data['title'] if data['title']
      story.description = data['description'] if data['description']
      story.status = data['status'] if data['status']
      story.media = data['media'] if data['media']
      story.user = Diggr::User.new_from_parsed_json(data['user']) if data['user']
      story.topic = Diggr::Topic.new_from_parsed_json(data['topic']) if data['topic']
      story.container = Diggr::Container.new_from_parsed_json(data['container']) if data['container']
      story.thumbnail = Diggr::Photo.new_from_parsed_json(data['thumbnail']) if data['thumbnail']
      story.href = data['href'] if data['href']

      story
    end
  end
end
