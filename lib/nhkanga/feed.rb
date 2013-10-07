module Nhkanga

  class Feed

    attr_accessor :feed, :title, :url

    def initialize(feed_url)

      # puts "Initializing Feed object: #{feed_url}"
      
      @feed = Feedzirra::Feed.fetch_and_parse(feed_url)

      @title = @feed.title
      @url = @feed.url

    end

    def links

      # puts "Parsing links"

      links = []

      @feed.entries.each do |entry|
        source = @feed.title
        # entry is Feedzirra entry & source is the Feedzirra title (news source)
        link = Link.new(entry, source)
        links << link
      end

      return links

    end

  end

end

