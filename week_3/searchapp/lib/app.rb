require 'rack'
require_relative 'header'
require_relative 'footer'
require_relative 'handle_results'
require_relative 'product'
require_relative 'product_catalog'
require_relative 'search_form'
require_relative 'browse'

class Application
  def self.run
    Rack::Builder.new do
      use Header
      use Footer
      map "/" do 
        run SearchForm
      end

      map "/search" do 
        run HandleResults.new
      end

      map "/browse" do
        run BrowseProducts.new
      end
    end
  end
end
