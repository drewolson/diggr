Gem::Specification.new do |s|
  s.name = %q{diggr}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Drew Olson"]
  s.date = %q{2008-11-15}
  s.email = ["drew@drewolson.org"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/diggr.rb", "lib/diggr/api.rb", "lib/diggr/api_error.rb", "lib/diggr/constants.rb", "lib/diggr/json_parser.rb", "lib/diggr/request.rb", "lib/diggr/response_classes/comment.rb", "lib/diggr/response_classes/container.rb", "lib/diggr/response_classes/digg.rb", "lib/diggr/response_classes/error.rb", "lib/diggr/response_classes/medium.rb", "lib/diggr/response_classes/photo.rb", "lib/diggr/response_classes/story.rb", "lib/diggr/response_classes/topic.rb", "lib/diggr/response_classes/user.rb", "test/test_api.rb", "test/test_comment.rb", "test/test_container.rb", "test/test_digg.rb", "test/test_error.rb", "test/test_json_parser.rb", "test/test_medium.rb", "test/test_photo.rb", "test/test_request.rb", "test/test_story.rb", "test/test_topic.rb", "test/test_user.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{diggr}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{ruby wrapper for digg api}
  s.test_files = ["test/test_api.rb", "test/test_comment.rb", "test/test_container.rb", "test/test_digg.rb", "test/test_error.rb", "test/test_json_parser.rb", "test/test_medium.rb", "test/test_photo.rb", "test/test_request.rb", "test/test_story.rb", "test/test_topic.rb", "test/test_user.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<need>, [">= 1.0.2"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.1.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<need>, [">= 1.0.2"])
      s.add_dependency(%q<json>, [">= 1.1.3"])
      s.add_dependency(%q<activesupport>, [">= 2.1.1"])
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<need>, [">= 1.0.2"])
    s.add_dependency(%q<json>, [">= 1.1.3"])
    s.add_dependency(%q<activesupport>, [">= 2.1.1"])
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
