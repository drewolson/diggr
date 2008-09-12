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
  
      %w(id link submit_date diggs comments title description status media href).each do |attribute|
        story.send("#{attribute}=",data[attribute]) if data[attribute]
      end

      story.user = Diggr::User.new_from_parsed_json(data['user']) if data['user']
      story.topic = Diggr::Topic.new_from_parsed_json(data['topic']) if data['topic']
      story.container = Diggr::Container.new_from_parsed_json(data['container']) if data['container']
      story.thumbnail = Diggr::Photo.new_from_parsed_json(data['thumbnail']) if data['thumbnail']

      story
    end
  end
end
