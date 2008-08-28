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
    HOST = "http://services.digg.com"
    USER_AGENT = 'diggr'
    APP_KEY = 'diggr'
  end
end
