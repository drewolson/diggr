require 'rubygems'
require 'need'
need { 'topic' }

module Diggr
  class Container
    attr_accessor :name, :short_name, :topics

    def initialize
      self.topics = []
    end

    def self.new_from_parsed_json(data)
      container = Container.new
      container.name = data['name']
      container.short_name = data['short_name']
      
      if data.has_key? 'topics'
        data['topics'].each do | topic_data |
          container.topics << Topic.new_from_parsed_json(topic_data)
        end
      end

      container
    end  
  end
end
