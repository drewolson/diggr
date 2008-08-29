module Diggr
  class Error
    attr_accessor :code, :message

    def self.new_from_parsed_json(data)
      error = Error.new

      data.each do |key,val|
        error.send("#{key}=",val)
      end

      error
    end
  end
end
