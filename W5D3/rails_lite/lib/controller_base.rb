require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, route_params = {})
    @req = req
    @res = res
    @params = req.params.merge(route_params)
    @already_built_response = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise 'Double Render Error' if already_built_response?
    res.status = 302
    res.set_header('Location',url)
    @already_built_response = true
    session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise 'Double Render Error' if already_built_response?
    res.status = 200
    res.set_header("Content-Type",content_type)
    res.write(content)
    @already_built_response = true
    session.store_session(@res)
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    class_name = (/^(\w+)Controller$/).match(self.class.to_s)[1].downcase

    file_path = "views/#{class_name}_controller/"

    str = File.read(file_path + template_name.to_s + '.html.erb')
    result = ERB.new(str).result(binding)
    render_content(result, 'text/html')
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    self.send(name)
    render name unless already_built_response?
  end
end
