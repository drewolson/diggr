require 'rubygems'
require 'need'

module Diggr
  class Topic
    attr_accessor :name, :short_name

    def self.new_from_parsed_json(data)
      topic = Topic.new
      topic.name = data['name']
      topic.short_name = data['short_name']
      topic
    end  
  end
end
