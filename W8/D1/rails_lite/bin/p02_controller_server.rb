require 'rack'
require_relative '../lib/controller_base'

class MyController < ControllerBase

  def self.call(env)
    self.new(env).execute
  end

  attr_reader :req, :res

  def initialize
    @req = Rack::Request.new(env)
    @res = Rack::Response.new
  end

  def render_content(content, content_type)
    res.write(content)
    set_header CONTENT_TYPE, content_type
    nil
  end

  def redirect_to(url)
    self.location = url
  end


  def go
    if req.path == "/cats"
      render_content("hello cats!", "text/html")
    else
      redirect_to("/cats")
    end
  end
end
# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   MyController.new(req, res).go
#   res.finish
# end

Rack::Server.start(
  app: MyController,
  Port: 3000
)

