require 'rubygems'
require 'need'
need { 'constants' }
need { 'request' }

module Diggr
  class Digg
    Diggr::Constants::VALID_ROOT_METHODS.each do |method|
      #TODO forward method name and arguments to Request after instantiation
      define_method(method) do |*args|
        Diggr::Request.new 
      end
    end
  end
end
