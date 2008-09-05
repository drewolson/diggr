= diggr

* Documentation - http://diggr.rubyforge.org
* Source - http://github.com/dfg59/diggr/tree/master

== DESCRIPTION:

Diggr is a ruby wrapper for the Digg API.

Diggr strives to remain consistent with the Digg API endpoints listed here: 
http://apidoc.digg.com/CompleteList. Endpoints are created in Diggr with method calls. 
Each node in an endpoint becomes a method call and each node which is an argument becomes 
an argument to the previous method. As an example, the following endpoint

/user/{user name}

in which the user name is "johndoe" would be created with this Diggr call:

diggr.user("johndoe")

To send the request to the Digg API and retrieve the results of the call, Diggr requests are
terminated in one of two ways.

1. Using the fetch method. By ending your request with the fetch method, your result will be
   returned to you. If the request is singular, you will receive a single object as a
   response. If the request is plural, you will receive a collection of objects stored in an
   array.

2. Using any Enumerable method. This works only on plural requests. In this case, it is
   unnecessary to use the fetch method.

See the synopsis for examples of each of these types of calls.

Options such as count or offset can be set using the options method and providing a hash of 
arguments. See synopsis for more information.

Note: In an effort to remain consistent with the Digg API, some method names do not follow
the ruby idiom of underscores. Although somewhat ugly, this allows a user read the Digg API
and understand the exact methods to call in Diggr to achieve their desired results.

== FEATURES/PROBLEMS:

* Diggr wraps the Digg API and returns both single elements and collections based on the request

== SYNOPSIS:

  require 'rubygems'
  require 'diggr'
  
  diggr = Diggr::API.new
  
  # retrieve a single user by user name and print the number of profile views
  user = diggr.user("johndoe").fetch
  puts user.profileviews

  # iterator over the most recent 10 stories (default return size) and print their titles
  diggr.stories.each do |story|
    puts story.title
  end

  # print the title of the 3 most recent hot stories
  diggr.stories.hot.options(:count => 3).each do |story|
    puts story.title
  end

  # build an array of stories whos title contains "foo"
  diggr.stories.inject([]) do |array,story|
    array << story if story.title =~ /foo/
    array
  end

  # print the title of the 2nd and 3rd most recent stories
  diggr.stories.options(:count => 2, :offset => 2).each do |story|
    puts story.title
  end

== REQUIREMENTS:

* need 1.0.2 or greater
* json 1.1.3 or greater
* activesupport 2.1.0 or greater

== INSTALL:

* install from rubyforge (major releases)
* sudo gem install diggr

* install from github (major and minor releases)
* sudo gem install dfg59-diggr --source=http://gems.github.com

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
