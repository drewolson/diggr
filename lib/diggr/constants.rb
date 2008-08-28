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
      :stories,
      :story,
      :topic,
      :users,
      :user
    ]
    HOST = "services.digg.com"
    PORT = 80
    USER_AGENT = 'diggr'
    APP_KEY = 'http://diggr.rubyforge.org'
    RESPONSE_TYPE = 'application/json'
  end
end
