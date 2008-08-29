module Diggr
  class Medium
    attr_accessor :name, :short_name

    def self.new_from_parsed_json(data)
      medium = Medium.new

      data.each do |key,val|
        medium.send("#{key}=",val)
      end

      medium
    end
  end
end
