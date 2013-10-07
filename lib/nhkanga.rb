require "nhkanga/version"
require "nhkanga/article"
require "nhkanga/feed"
require "nhkanga/hiragana"
require "nhkanga/katakana"
require "nhkanga/link"
require "nhkanga/scraper"
require "nhkanga/yahoo_scraper"

module Nhkanga

  # Scrapes articles from a Yahoo Japanese news RRS feed
  # By default scrapes all articles
  # Limit amount of articles scraped with iter parameter (Fixnum)
  def self.scrape_feed_articles(feed_url, iter = 0)

    feed = Feed.new(feed_url)
    puts "Created feed from: #{feed_url}"

    articles = []

    if iter == 0

      feed.links.each do |link|
        article = self.scrape_article(link)
        puts "Adding article to array."
        articles << article
      end

    elsif iter.is_a?(Fixnum)

      iter.times do |i|
        link = feed.links[i]
        article = self.scrape_article(link)
        puts "Adding article to array."
        articles << article
      end

    else

      puts "Invalid iter input - please enter :all or a Fixnum"
      return

    end

    return articles

  end

  def self.scrape_article(link)

    puts "Scraping link: #{link.url}"
    scraper = YahooScraper.new(link)

    # puts "Scraping text"
    scraper.scrape_text
    # puts "Creating article."

    article = Article.new(link, scraper.text)

    return article

  end

end