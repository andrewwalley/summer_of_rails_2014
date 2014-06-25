require 'rack'

class LinksApp
  def call(env)
    content = %Q{
      <h1> Links </h1>
      <ol>
        <li><a href="/answer?choice=1">First Choice</a></li>
        <li><a href="/answer?choice=2">Second Choice</a></li>
        <li><a href="/answer?choice=3">Third Choice</a></li>
      </ol>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class AnswerApp
  CHOICES = {
    "1" => "<p>You chose poorly</p>",
    "2" => "<p>You chose wisely</p>",
    "3" => "<p>You chose poorly</p>"
  }

  def call(env)
    # create a request object
    request = Rack::Request.new(env)

    # grab the choice out of the request.
    # this parses the name/value out of the URL
    choice = request.GET["choice"]

    # look up the choice in our CHOICES hash
    content = CHOICES[choice] || "Not an option."

    # Render response
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = Rack::Builder.new do

  map "/" do
    run LinksApp.new
  end

  map "/answer" do 
    run AnswerApp.new
  end

end

server = Rack::Server.new :app => app, :server => "webrick"
server.start
