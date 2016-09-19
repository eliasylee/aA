require 'rack'

class Static

  attr_reader :app

  def initialize(app)
    @app = app
  end

  def call(env)
    file_path = env["PATH_INFO"]

    begin
      if match = file_path.match(/(public\/.*\.(.*))/)
        path, type = match.captures
        render_asset(path, type)
      else
        @app.call(env)
      end
    rescue Exception => e
      render_error(e)
    end
  end

  private

  def render_asset(path, type)
    erb_content = File.read("./#{path}")
    content = ERB.new(erb_content).result(binding)

    content_type = Rack::Mime::MIME_TYPES[type]

    ["200", {"Content-type" => content_type}, content]
  end

  def render_error(e)
    @e = e
    erb_content = File.read('./lib/templates/rescue.html.erb')
    ["404", {"Content-type" => "text/html"}, ERB.new(erb_content).result(binding)]
  end
end
