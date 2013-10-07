#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'

describe Nhkanga::Katakana do

  describe "@@list" do

    it "should have a @@list class variable" do

      Nhkanga::Katakana.list.should_not be_nil

    end

    it "should start with 'ア'" do

      Nhkanga::Katakana.list.first.should eql('ア')

    end

  end

end