require 'rubygems'
require 'active_support/inflector'
require 'json'
require 'need'
need { 'path_error' }

module Diggr
  class JSONParser
    def parse(data)
      build_objects_from_parsed_json(JSON.parse(data))
    end

    private

    def build_objects_from_parsed_json(parsed_data)
      if parsed_data.has_key?('code') && parsed_data['code'] == 404
        raise PathError, "specified path returned a 404 error"
      end

      response_data = parsed_data.select { |key,val| Diggr::Constants::RESPONSE_CLASSES.include?(key) }[0]

      collection_type, collection_data = response_data

      klass = find_class(collection_type)

      object_collection = collection_data.inject([]) do |collection,object_data|
        collection << klass.new_from_parsed_json(object_data) 
      end

      object_collection.size == 1 ? object_collection.first : object_collection
    end

    def find_class(collection_type)
      file_name = Inflector.singularize(collection_type)
      need { File.join('response_classes',file_name) }
      Inflector.constantize('Diggr::'+ Inflector.camelize(file_name))
    end 
  end
end

