Gem::Specification.new do |s|
  s.name = %q{diggr}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Drew Olson"]
  s.date = %q{2008-09-05}
  s.description = %q{Diggr is a ruby wrapper for the Digg API.  Diggr strives to remain consistent with the Digg API endpoints listed here:  http://apidoc.digg.com/CompleteList. Endpoints are created in Diggr with method calls.  Each node in an endpoint becomes a method call and each node which is an argument becomes  an argument to the previous method. As an example, the following endpoint  /user/{user name}  in which the user name is "johndoe" would be created with this Diggr call:  diggr.user("johndoe")  To send the request to the Digg API and retrieve the results of the call, Diggr requests are terminated in one of two ways.  1. Using the fetch method. By ending your request with the fetch method, your result will be returned to you. If the request is singular, you will receive a single object as a response. If the request is plural, you will receive a collection of objects stored in an array.  2. Using any Enumerable method. This works only on plural requests. In this case, it is unnecessary to use the fetch method.  See the synopsis for examples of each of these types of calls.  Note: In an effort to remain consistent with the Digg API, some method names do not follow the ruby idiom of underscores. Although somewhat ugly, this allows a user read the Digg API and understand the exact methods to call in Diggr to achieve their desired results.}
  s.email = ["drew@drewolson.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".DS_Store", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/diggr.rb", "lib/diggr/api.rb", "lib/diggr/api_error.rb", "lib/diggr/constants.rb", "lib/diggr/json_parser.rb", "lib/diggr/request.rb", "lib/diggr/response_classes/comment.rb", "lib/diggr/response_classes/container.rb", "lib/diggr/response_classes/digg.rb", "lib/diggr/response_classes/error.rb", "lib/diggr/response_classes/medium.rb", "lib/diggr/response_classes/photo.rb", "lib/diggr/response_classes/story.rb", "lib/diggr/response_classes/topic.rb", "lib/diggr/response_classes/user.rb", "test/test_api.rb", "test/test_comment.rb", "test/test_container.rb", "test/test_digg.rb", "test/test_error.rb", "test/test_json_parser.rb", "test/test_medium.rb", "test/test_photo.rb", "test/test_request.rb", "test/test_story.rb", "test/test_topic.rb", "test/test_user.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://diggr.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{diggr}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Diggr is a ruby wrapper for the Digg API}
  s.test_files = ["test/test_api.rb", "test/test_comment.rb", "test/test_container.rb", "test/test_digg.rb", "test/test_error.rb", "test/test_json_parser.rb", "test/test_medium.rb", "test/test_photo.rb", "test/test_request.rb", "test/test_story.rb", "test/test_topic.rb", "test/test_user.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<need>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.1.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<need>, [">= 1.0.2"])
      s.add_dependency(%q<json>, [">= 1.1.3"])
      s.add_dependency(%q<activesupport>, [">= 2.1.0"])
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<need>, [">= 1.0.2"])
    s.add_dependency(%q<json>, [">= 1.1.3"])
    s.add_dependency(%q<activesupport>, [">= 2.1.0"])
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
