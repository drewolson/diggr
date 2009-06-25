module Diggr
  module Constants
    VALID_ROOT_METHODS = [
      :containers,
      :container,
      :errors,
      :error,
      :galleryphotos,
      :galleryphoto,
      :media,
      :medium,
      :shorturl,
      :shorturls,
      :stories,
      :story,
      :topic,
      :topics,
      :users,
      :user
    ]
    RESPONSE_CLASSES = [
      "containers",
      "errors",
      "diggs",
      "comments",
      "photos",
      "media",
      "shorturls",
      "stories",
      "topics",
      "users"
    ]
    HOST = "services.digg.com"
    PORT = 80
    USER_AGENT = 'diggr'
    APP_KEY = 'http://diggr.rubyforge.org'
    RESPONSE_TYPE = 'application/json'
  end
end
