require 'rack'

class MyApp
  def call(env)
    
    content = File.read('index.html')
    
    [200, {"Content-type" => "text/html"}, [content] ]

  end
end

app = MyApp.new

server = Rack::Server.new :app => app, :server => "webrick"
server.start
