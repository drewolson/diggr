require 'rubygems'
require 'active_support/inflector'
require 'json'
require 'need'

module Diggr
  class JSONParser
    def parse(data)
      build_objects_from_parsed_json(JSON.parse(data))
    end

    private

    def build_objects_from_parsed_json(parsed_data)
      response_objects = parsed_data.select { |key,val| Diggr::Constants::RESPONSE_CLASSES.include?(key) }[0]

      collection_type, collection_data = response_objects

      klass = find_class(collection_type)

      collection_data.inject([]) do |collection,object_data|
        collection << klass.new_from_parsed_json(object_data) 
      end
    end

    def find_class(collection_type)
      file_name = Inflector.singularize(collection_type)
      need { File.join('response_classes',file_name) }
      Inflector.constantize('Diggr::'+ Inflector.camelize(file_name))
    end 
  end
end
