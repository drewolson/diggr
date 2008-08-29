require 'rubygems'
require 'need'
need { 'constants' }
need { 'request' }

module Diggr
  class API
    Diggr::Constants::VALID_ROOT_METHODS.each do |method|
      define_method(method) do |*args|
        request = Diggr::Request.new 
        request.send(method,*args)
      end
    end
  end
end
