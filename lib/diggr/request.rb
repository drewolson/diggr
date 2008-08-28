require 'cgi'
require 'rubygems'
require 'need'
need { 'constants' }
need { 'json_parser' }

module Diggr
  class Request
    def initialize
      @end_point = ''
    end

    def options(params)
      @options = params.inject("") do |options,(key,val)|
        options + "&#{key}=#{cleanse(val)}"
      end
    end

    def method_missing(name,*args,&block)
      @end_point += "/#{name}"

      unless args.empty?
        @end_point += "/#{args.join(',')}"
      end 

      self
    end

    def each
      fetch.each do |item|
        yield item
      end
    end

    def fetch
      response = make_request
      Diggr::JSONParser.parse(response)
    end

    private

    def make_request

    end

    def cleanse(val)
      if val.kind_of? String
        val = CGI.escape(val)
      end
      val
    end

    def uri
      uri = Diggr::Constants::HOST + @end_point + "?" + "appkey=#{Diggr::Constants::APP_KEY}"
      uri += @options if @options
      uri
    end
  end
end
