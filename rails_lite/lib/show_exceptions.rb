require 'erb'

class ShowExceptions
  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      app.call(env)
    rescue Exception => e
      render_exception(e)
    end
  end

  private

  def render_exception(e)
    @e = e
    erb_content = File.read('./lib/templates/rescue.html.erb')
    ["500", {"Content-type" => "text/html"}, ERB.new(erb_content).result(binding)]
  end

end
