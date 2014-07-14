require "sinatra/base"
require "json"

QUOTES = [
  {
    :text => "You are never too old to set another goal or to dream a new dream.",
    :person => "C.S. Lewis"
  },
  {
    :text => "By failing to prepare, you are preparing to fail.",
    :person => "Benjamin Franklin"
  },
  {
    :text => "D'oh!",
    :person => "Homer Simpson"
  }
]

class QuoteAPI < Sinatra::Base
  get "/quotes.json" do
    content_type :json
    QUOTES.to_json
  end

  get "/" do
    File.read(File.join('public', 'index.html'))
  end

  get "/app.js" do
    File.read(File.join('public', 'app.js'))
  end
end
