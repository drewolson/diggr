require 'rubygems'
require 'active_support'
require 'json'
require 'need'
need { 'api_error' }
need { 'constants' }

module Diggr
  class JSONParser
    def parse(data)
      build_objects_from_parsed_json(JSON.parse(data))
    end

    private

    def build_objects_from_parsed_json(parsed_data)
      if parsed_data.has_key?('code') && parsed_data['code'] == 404
        raise APIError, "specified path returned a 404 error"
      end

      collection_type, collection_data = cleanse_json(parsed_data)

      if collection_type.nil?
        nil
      else
        build_result(collection_type, collection_data)
      end
    end

    def build_result(collection_type, collection_data)
      klass = find_class(collection_type)

      object_collection = collection_data.inject([]) do |collection,object_data|
        collection << klass.new_from_parsed_json(object_data) 
      end

      object_collection.size == 1 ? object_collection.first : object_collection
    end

    def cleanse_json(parsed_data)
      parsed_data.select { |key,val| Diggr::Constants::RESPONSE_CLASSES.include?(key) }[0]
    end

    def find_class(collection_type)
      file_name = collection_type.singularize
      need { File.join('response_classes',file_name) }
      ('Diggr::' + file_name.camelize).constantize
    end 
  end
end

