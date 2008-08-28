require 'cgi'
require 'net/http'
require 'rubygems'
require 'need'
need { 'constants' }
need { 'json_parser' }

module Diggr
  class Request
    def initialize
      @end_point = ''
      @options = nil
    end

    def options(params)
      @options = params.inject("") do |options,(key,val)|
        options + "&#{key}=#{cleanse(val)}"
      end
      self
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
      #Diggr::JSONParser.parse(response)
    end

    private

    def make_request
      Net::HTTP.start(Diggr::Constants::HOST,Diggr::Constants::PORT) do |http|
        http.get(
          path,
          'User-Agent' => Diggr::Constants::USER_AGENT,
          'Accept' => Diggr::Constants::RESPONSE_TYPE
        ).body
      end
    end

    def cleanse(val)
      if val.kind_of? String
        val = CGI.escape(val)
      end
      val
    end

    def path
      path = @end_point + "?appkey=#{cleanse(Diggr::Constants::APP_KEY)}"
      path += @options if @options
      path
    end
  end
end
