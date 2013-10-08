require "spec_helper"

describe Nhkanga::Scraper do

  before(:all) do

    feed = Pages::FEED
    pages = Pages.pages
    FakeWeb.register_uri(:any, %r(/.xml/), :response => feed)
    FakeWeb.register_uri(:any, %r(/rd.yahoo.co.jp), pages)

    @url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
    @source = 'Yahoo'
    @entry = Nhkanga::Feed.new(@url).feed.entries.first
    @link = Nhkanga::Link.new(@entry, @source)
    @scraper = Nhkanga::Scraper.new(@link)

  end

  describe "#url" do

    it "should have a URL method" do
      @scraper.should respond_to(:url)
    end

    it "should assign the URL from @link.url" do
      @scraper.url.should eql(@link.url)
    end

  end

  describe "#page" do

    it "should be assigned" do
      @scraper.page.should_not be_nil
    end

    it "should be a Nokogiri::HTML::Document" do
      @scraper.page.should be_a(Nokogiri::HTML::Document)
    end

  end

  describe "#scrape_text" do

    it "should raise an error" do
      expect{@scraper.scrape_text}.to raise_error
    end

  end

end

