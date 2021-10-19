require 'rack'
require 'byebug'



    # basic_app = Proc.new do |env|
    #     req = Rack::Request.new(env)
    #     res = Rack::Response.new
    #     res['Content-Type'] = 'text/html'
    #     res.write("Hello world!")
    #     res.finish
    # end

    
        basic_app = Proc.new do |env|
          ['200', {'Content-Type' => 'text/html'}, ['hello world']]
        end
  


  Rack::Server.start({
    app: basic_app,
    Port: 3000
  })