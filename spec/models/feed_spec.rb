require 'spec_helper'

describe Nhkanga::Feed do

  before(:all) do

    feed = Pages::FEED
    pages = Pages.pages
    FakeWeb.register_uri(:any, %r(/.xml/), :response => feed)
    FakeWeb.register_uri(:any, %r(/rd.yahoo.co.jp), pages)

    @url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
    @feed = Nhkanga::Feed.new(@url)

  end

  it "should have a URL" do
    @feed.url.should_not be_nil
  end

  it "should have a title" do
    @feed.title.should_not be_nil
  end

  it "should create a feed of length > 0" do
    @feed.feed.entries.should_not have(0).items
  end

  describe "#links" do

    it "should return an array of links with information" do
      links = @feed.links
      links.should_not be_nil
    end

  end

end