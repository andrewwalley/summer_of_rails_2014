module Logger
  private
  def log(message)
    output = "#{Time.now} : #{message}"
    File.open("log.txt", "w") do |logfile|
        logfile << output
    end
  end
end
