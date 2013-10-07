require 'spec_helper'

describe Nhkanga do

  it "should be defined" do
    Nhkanga::VERSION.should_not be_nil
  end

  describe '.get_articles' do

    it "should respond to the .scrape_feed_articles method" do
      Nhkanga.should respond_to(:scrape_feed_articles)
    end

    it "should return an array of articles" do
      url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
      articles = Nhkanga.scrape_feed_articles(url, 3)
      articles.first.should be_a(Nhkanga::Article)
    end

    it "should scrape all articles by default" do
      url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
      articles = Nhkanga.scrape_feed_articles(url)
      articles.should have_at_least(4).items
    end

  end

end