require 'rubygems'
require 'need'
need { 'container' }

module Diggr
  class Topic
    attr_accessor :name, :short_name, :container

    def self.new_from_parsed_json(data)
      topic = Topic.new
      topic.name = data['name']
      topic.short_name = data['short_name']

      if data.has_key? 'container'
        topic.container = Diggr::Container.new_from_parsed_json(data['container']) 
      end

      topic
    end  
  end
end
