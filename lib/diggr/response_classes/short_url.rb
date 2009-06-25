module Diggr
  class ShortUrl
    attr_accessor :short_url, :views

    def self.new_from_parsed_json(data)
      short_url = ShortUrl.new
      short_url.short_url = data['short_url']
      short_url.views = data['views']
      short_url
    end  
  end
end
