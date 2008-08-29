module Diggr
  class Digg
    attr_accessor :date, :story, :id, :user, :status

    def self.new_from_parsed_json(data)
      digg = Digg.new

      data.each do |key,val|
        digg.send("#{key}=",val)
      end

      digg
    end  
  end
end
