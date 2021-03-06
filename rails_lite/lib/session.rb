require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie = req.cookies['_rails_lite_app']
    @values = JSON.parse cookie if cookie
    @values ||= {}
  end

  def [](key)
    @values[key]
  end

  def []=(key, val)
    @values[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', {
      path: '/',
      value: @values.to_json
      }
    )
  end
end
