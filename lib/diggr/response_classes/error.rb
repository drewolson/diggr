module Diggr
  class Error
    attr_accessor :code, :message

    def self.new_from_parsed_json(data)
      error = Error.new
      error.code = data['code']
      error.message = data['message'] 
      error
    end
  end
end
