module Diggr
  class User
    attr_accessor :name, :fullname, :icon, :registered, :profileviews, :links

    def self.new_from_parsed_json(data)
      user = User.new

      data.each do |key,val|
        user.send("#{key}=",val)
      end

      user
    end
  end
end
