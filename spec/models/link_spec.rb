require 'spec_helper'

describe Nhkanga::Link do

  before(:all) do

    feed = Pages::FEED
    pages = Pages.pages
    FakeWeb.register_uri(:any, %r(/.xml/), :response => feed)
    FakeWeb.register_uri(:any, %r(/rd.yahoo.co.jp), pages)

    @url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
    @source = 'Yahoo'
    @entry = Nhkanga::Feed.new(@url).feed.entries.first
    @link = Nhkanga::Link.new(@entry, @source)

  end

  describe "#title" do

    it "should have a title" do

      @link.title.should_not be_nil

    end

    it "should assign title from the entry" do

      @link.title.should eql(@entry.title)

    end

  end

  describe "#url" do

    it "should have a URL" do

      @link.url.should_not be_nil

    end

  end

  describe "#date" do

    it "should have a date" do

      @link.date.should_not be_nil

    end

    it "should assign the date from the entry" do

      @link.date.should eql(@entry.published)

    end

  end

  describe "#source" do

    it "should have a source" do

      @link.source.should_not be_nil

    end

    it "should assign the source from @source" do

      @link.source.should eql(@source)

    end

  end

  describe "#category" do

    it "should have a category" do

      @link.category.should_not be_nil

    end

    it "should assign the category from the entry" do

      @link.category.should eql(@entry.title.split[0])

    end

  end

end