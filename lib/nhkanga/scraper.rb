require "open-uri" 

 module Nhkanga

  class Scraper
    module Exceptions
      class NotImplemented < StandardError; end
    end

    attr_reader :url
    attr_reader :page
    attr_accessor :text
    attr_accessor :link

    def initialize(link)

      @link = link
      @url = @link.url

      # Offline
      # @page = Nokogiri::HTML(open(@url))
      # Online
       @page = Nokogiri::HTML(open(@url).read)
      
    end

    # Get the article text from the URL
    # Implemented differently for each news site
    def scrape_text
      raise(Scraper::Exceptions::NotImplemented, "Not implemented")
    end

  end

end