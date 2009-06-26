require 'rubygems'
require 'need'
need { 'constants' }
need { 'request' }

module Diggr
  class API
    def initialize(app_key = Diggr::Constants::APP_KEY)
      @app_key = app_key
    end

    Diggr::Constants::VALID_ROOT_METHODS.each do |method|
      define_method(method) do |*args|
        request = Diggr::Request.new(@app_key)
        request.send(method,*args)
      end
    end
  end
end
