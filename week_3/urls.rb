require 'rack'

class HomeApp
  def call(env)
    content = %Q{
      <h1>Welcome</h1>
      <p>This is the home page.</p>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class AboutApp
  def call(env)
    content = %Q{
      <h1>About!</h1>
      <p>This is the about page.</p>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = Rack::Builder.new do
  map "/" do
    run HomeApp.new
  end
  map "/about" do
    run AboutApp.new
  end
  map "/admin.php" do 
    use Rack::Auth::Basic, "Restricted Area" do |user, passwd|
      user == 'super' && passwd == 'secretsauce'
    end
  
    run lambda { |env|
      [200, {"Content-type" => "text/html"}, ["<h1>Welcome, admin!</h1>"]]
    }
  end
end




server = Rack::Server.new :app => app, :server => "webrick"
server.start
