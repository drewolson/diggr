require 'enumerator'
require 'cgi'
require 'net/http'
require 'rubygems'
require 'need'
need { 'constants' }
need { 'json_parser' }

module Diggr
  class Request
    include Enumerable

    def initialize(app_key)
      @end_point = ''
      @options = ''
      @app_key = app_key
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

    def each(&block)
      result = fetch

      if result.kind_of? Array
        fetch.each(&block)
      else
        yield result
      end
    end

    def fetch
      response = make_request
      Diggr::JSONParser.new.parse(response)
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
      @end_point + "?appkey=#{cleanse(@app_key)}" + @options
    end
  end
end
