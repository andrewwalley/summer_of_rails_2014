require 'rack'


class HelloApp
  def call(env)

    content = env.map{|key, value| "#{key} => #{value}"}.sort.join("\n")
    if content.include?('Firefox/29.0')
      content += "\n It's Firefox"
    end
    puts content
    if content.include?('Explorer')
      content += "\n Why are you using IE?"
    end
    puts content
    if content.include?('Chrome')
      content += "\n Hi Chrome user!"
    end
    puts content
    
    [200, {"Content-type" => "text/plain"}, [content] ]

  

  end
end

app = HelloApp.new

server = Rack::Server.new :app => app, :server => "webrick"
server.start
