require 'rack'

class Home
  def call(env)
    content = %Q{
      <!DOCTYPE html>
      <html lang="en-us">
        <head>
          <meta charset="utf-8">
          <title>Home</title>
        </head>
        <body>
          <h1>Andrew Walley</h1>
          <p>
            This is a work in progress...feel free to comment with ideas for 
            improvement
          </p>
        </body>
      </html>
    }
  [200, {"Content-type" => "text/html"}, [content]]
  end
end

class AboutMe
  def call(env)
    content = %Q{
      <!DOCTYPE html>
      <html lang="en-us">
        <head>
          <meta charset="utf-8">
          <title>About Me</title>
        </head>
        <body>
          <h1>A Little About Me</h1>
          <p>
            My name is Andrew Walley. I am 27 years old and currently live in 
            Eau Claire Wisconsin. I attend Chippewa Valley Technical College and 
            my major is I.T. Software Developement. 
          </p>
        </body>
      </html>
    }
  [200, {"Content-type" => "text/html"}, [content]]
  end
end

class Resume
  def call(env)
    content = %Q{
      <!DOCTYPE html>
      <html lang="en-us">
        <head>
          <meta charset="utf-8">
          <title>Resume</title>
        </head>
        <body>
          <h1>Check Out My Resume</h1>
          <h2>Experience</h2>
          <h2>Education</h2>
          <h2>Skills</h2>
          <h2>Summary of Qualifications</h2>
        </body>
      </html>
    }
  [200, {"Content-type" => "text/html"}, [content]]
  end
end

class Contact
  def call(env)
    content = %Q{
      <form method="POST" action="/submit_contact">
        <label for="first_name">Name: </label>
        <input id="first_name" type="text" name="first_name"><br>
        <label for="email">Email: </label>
        <input id="email" type="text" name="email"><br>
        <textarea cols="20" rows="10" id="message" name="message">
          Enter a message</textarea><br>
        <input type="submit" value="Submit">
      </form>
    }
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

class SubmitContact
  def call(env)
    content = ""
    request = Rack::Request.new(env)
    first_name = request.post?["first_name"]
    email = request.post?["email"]
    message = request.post?["message"]
    content += "<p>name: #{first_name}</p>"
    content += "<p>email: #{email}</p>"
    content += "<p>message: <br>#{message}</p>"
    [200, {"Content-type" => "text/html"}, [content]]
  end
end

app = Rack::Builder.new do
  map "/" do 
    run Home.new
  end

  map "/about_me" do 
    run AboutMe.new
  end

  map "/resume" do 
    run Resume.new
  end

  map "/contact" do
    run Contact.new
  end

  map "/submit_contact" do 
    run SubmitContact.new
  end
end


server = Rack::Server.new :app => app, :server => "webrick"
server.start
