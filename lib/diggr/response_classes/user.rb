module Diggr
  class User
    attr_accessor :name, :icon, :registered, :profileviews

    def self.new_from_parsed_json(data)
      user = User.new

      data.each do |key,val|
        user.send("#{key}=",val)
      end

      user
    end
  end
end
