require 'rubygems'
require 'json'

module Diggr
  class JSONParser
    def parse(data)
      build_objects_from_parsed_json(JSON.parse(data))
    end

    private

    def build_objects_from_parsed_json(parsed_data)
      parsed_data
    end
  end
end
