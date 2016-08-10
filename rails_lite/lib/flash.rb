require 'json'

class Flash
  attr_accessor :now

  def initialize(req)
    cookie = req.cookies['_rails_lite_app_flash']
    @now = JSON.parse cookie if cookie
    @now ||= {}
    @store ||= {}
  end

  def [](key)
    @now[key] || @store[key]
  end

  def []=(key, val)
    @store[key] = val
  end

  def store_flash(res)
    res.set_cookie('_rails_lite_app_flash', {
        path: '/',
        value: @store.to_json
      }
    )
  end

end
