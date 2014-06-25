class Footer
  def initialize(app)
    @app = app
  end

  def call(env)
    # Let the app do its thing
    status, headers, response = @app.call(env)

    # add tto the body
    response_body = response.join("\n")
    response_body << "<footer>Generated #{Time.now}</footer>"

    # We changed the content length so we must 
    # change the header
    headers["Content-length"] = response_body.length.to_s

    # put the request back to the way it needs to be
    [status, headers, [response_body]]
  end
end
