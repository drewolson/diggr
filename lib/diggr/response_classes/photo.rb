require 'rubygems'
require 'need'
need { 'user' }

module Diggr
  class Photo
    attr_accessor :id, :submit_date, :comments, :title, :user, :src, :href

    def self.new_from_parsed_json(data)
      photo = Photo.new

      data.each do |key,val|
        unless key == 'user'
          photo.send("#{key}=",val)
        end
      end

      if data.has_key? 'user'
        photo.user = Diggr::User.new_from_parsed_json(data['user']) 
      end

      photo
    end  
  end
end
