require 'rubygems'
require 'test/unit'
require 'need'
need { '../lib/diggr/request' }
need { '../lib/diggr/constants' }

class Diggr::Request
  attr_accessor :end_point
end

class TestRequest < Test::Unit::TestCase
  def test_request_instantiation
    assert_nothing_raised do
      Diggr::Request.new
    end
  end

  def test_simple_end_point
    request = Diggr::Request.new
    request.media

    assert_equal '/media', request.end_point
  end

  def test_simple_end_point_with_args
    request = Diggr::Request.new
    request.error('123')

    assert_equal '/error/123', request.end_point
  end
end
