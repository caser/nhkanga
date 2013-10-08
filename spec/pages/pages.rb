# encoding: utf-8

module Pages

  puts Dir.pwd

  FEED = open('spec/pages/feed.xml').read

  def self.pages

    page_0 = open("spec/pages/page0.html").read
    page_1 = open("spec/pages/page1.html").read
    page_2 = open("spec/pages/page2.html").read
    page_3 = open("spec/pages/page3.html").read
    page_4 = open("spec/pages/page4.html").read
    page_5 = open("spec/pages/page5.html").read
    page_6 = open("spec/pages/page6.html").read
    page_7 = open("spec/pages/page7.html").read
    page_8 = open("spec/pages/page8.html").read
    page_9 = open("spec/pages/page9.html").read

    page_array = [page_0, page_1, page_3, page_4, page_5, page_6, page_7, page_8, page_9]

    pages = []

    page_array.each do |page|
      hash = { :body => page }
      pages << hash
    end

    return pages

  end

end