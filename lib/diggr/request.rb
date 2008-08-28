require 'cgi'
require 'rubygems'
require 'need'
need { 'constants' }

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
        @end_point += "/#{args.join('/')}"
      end 

      self
    end

    private

    def cleanse(val)
      if val.kind_of? String
        val = CGI.escape(val)
      end
      val
    end

    def uri
      uri = Diggr::HOST + @end_point + "?" + Diggr::API_KEY
      uri += @options if @options
      uri
    end
  end
end
