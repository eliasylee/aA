require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'
require_relative './flash'

class ControllerBase
  attr_reader :req, :res, :params

  @@protect_from_forgery = false

  # Setup the controller
  def initialize(req, res, route_params = {} )
    @req = req
    @params = req.params.merge(route_params)
    @res = res
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Error" if already_built_response?
    @res.header['Location'] = url
    @res.status = 302

    session.store_session(@res)
    flash.store_flash(@res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Error" if already_built_response?
    @res['Content-type'] = content_type
    @res.body = [content]

    session.store_session(@res)
    flash.store_flash(@res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    raise "Error" if already_built_response?
    controller_name = self.class.to_s.underscore

    erb_content = File.read("views/#{controller_name}/#{template_name}.html.erb")
    content = ERB.new(erb_content).result(binding)
    render_content(content, "text/html")

    session.store_session(@res)
    flash.store_flash(@res)
    @already_built_response = true
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  def flash
    @flash ||= Flash.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    if @req.request_method != "GET" && @@protect_from_forgery
      check_authenticity_token
    end

    self.send(name)
    render(name) unless already_built_response?
  end

  def form_authenticity_token
    @token ||= SecureRandom::urlsafe_base64(128)

    res.set_cookie('authenticity_token', {
      path: '/',
      value: @token
      }
    )

    @token
  end

  def check_authenticity_token
    token = @req.cookies['authenticity_token']

    unless token && token == @params['authenticity_token']
      handle_unverified_request
    end
  end

  def self.protect_from_forgery
    @@protect_from_forgery = true
  end

  def handle_unverified_request
    raise "Invalid authenticity token"
  end

end
