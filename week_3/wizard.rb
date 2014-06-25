require 'rack'

module Render
  def render_page(step)
    content = File.read(step)
    [200, {"Content-type"=> "text/html"}, [content]]
  end
end

include Render

app = Rack::Builder.new do 
  
  map "/page1.html" do 
    run lambda { |env|
    step = 'page1.html'
    self.render_page(step)
    }
  end

  map "/page2.html" do 
    run lambda { |env|
    step = 'page2.html'
    self.render_page(step)
    }
  end

  map "/page3.html" do 
    run lambda { |env|
    step = 'page3.html'
    self.render_page(step)
    }
  end

  map "/page4.html" do 
    run lambda { |env|
    step = 'page4.html'
    self.render_page(step)
    }
  end
end


server = Rack::Server.new :app => app, :server => "webrick"
server.start
