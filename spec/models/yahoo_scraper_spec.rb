require 'spec_helper'

describe Nhkanga::YahooScraper do

  before(:all) do

      @url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
      @source = 'Yahoo'
      @entry = Nhkanga::Feed.new(@url).feed.entries.first
      @link = Nhkanga::Link.new(@entry, @source)
      @yahoo_scraper = Nhkanga::YahooScraper.new(@link)

  end

  describe '#scrape_text' do

    it 'should have a method #scrape_text' do
      @yahoo_scraper.should respond_to(:scrape_text)
    end

    it 'should assign the @text instance variable' do
      @yahoo_scraper.scrape_text
      @yahoo_scraper.text.should_not be_nil
    end

  end

end