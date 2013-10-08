#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe "Article" do

  before(:all) do

      feed = Pages::FEED
      pages = Pages.pages
      FakeWeb.register_uri(:any, %r(/.xml/), :response => feed)
      FakeWeb.register_uri(:any, %r(/rd.yahoo.co.jp), pages)

      @url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
      @source = 'Yahoo'
      @entry = Nhkanga::Feed.new(@url).feed.entries.first
      @link = Nhkanga::Link.new(@entry, @source)
      @yahoo_scraper = Nhkanga::YahooScraper.new(@link)
      @text = @yahoo_scraper.scrape_text
      @article = Nhkanga::Article.new(@link, @text)

  end

  describe '#initialize' do

    it "should assign a @url variable" do
      @article.url.should_not be_nil
    end

    it "should assign a @source variable" do
      @article.source.should_not be_nil
    end

    it "should assign a @date variable" do
      @article.date.should_not be_nil
    end

    it "should assign a @category variable" do
      @article.category.should_not be_nil
    end

    it "should assign a @length variable" do
      @article.length.should_not be_nil
    end

  end

  describe "#is_kanji?(char)" do

    it "should return true if char is a kanji" do
      @article.is_kanji?('愛').should be_true
    end

    it "should return false if char is a hiragana" do
      @article.is_kanji?('あ').should be_false
    end

    it "should return false if char is a katakana" do
      @article.is_kanji?('ア').should be_false
    end

    it "should return false if char is a roman alphabet character" do
      @article.is_kanji?('a').should be_false
    end

    it "should return false if char is a number" do
      @article.is_kanji?('4').should be_false
    end

    it "should return false if char is a Japanese style (wide) number" do
      @article.is_kanji?('４').should be_false
    end

  end

  describe '@kanji_hash' do

    it "should be assigned at initialization" do
      @article.kanji_hash.should_not be_nil
    end

    it "should be empty if we forcibly make it so" do
      @article.kanji_hash = {}
      @article.kanji_hash.should be_empty
    end

  end

  describe '#create_kanji_hash' do

    it "should reassign variables to @kanji_hash from @text" do
      @article.create_kanji_hash
      @article.kanji_hash.should_not be_empty
    end

  end

end