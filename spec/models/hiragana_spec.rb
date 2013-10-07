#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe Nhkanga::Hiragana do

  describe "@@list" do

    it "should have a @@list class variable" do

      Nhkanga::Hiragana.list.should_not be_nil

    end

    it "should start with 'あ'" do

      Nhkanga::Hiragana.list.first.should eql('あ')

    end

  end

end