# Nhkanga

Japanese news scraper

Scrapes text and kanji from various Japanese news sites.

Currently only supports Yahoo news.

## Installation

Add this line to your application's Gemfile:

    gem 'nhkanga'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nhkanga

## Usage

Nhkanga takes in a Yahoo Japan RSS feed and will spit out an array of Article objects from the list.

ex:
```Ruby
url = "http://headlines.yahoo.co.jp/rss/all-dom.xml"
articles = Nhkanga.scrape_feed_articles(url)
```

You can limit the number of articles being scraped by passing in an additional paramenter:

```Ruby
articles = Nhkanga.scrape_feed_articles(url, 3) #=> Scrapes 3 articles
```

Here is some sample usage of the Article object returned in the array:

(category variable currently only occasionally working)

```Ruby
1.9.3-p448 :011 > article = articles[0]
1.9.3-p448 :012 > article.instance_variables
 => [:@url, :@source, :@date, :@title, :@category, :@text, :@length, :@kanji_hash] 
1.9.3-p448 :013 > article.url
 => "http://rd.yahoo.co.jp/rss/l/headlines/soci/asahik/*http://headlines.yahoo.co.jp/hl?a=20131008-00000001-asahik-soci" 
1.9.3-p448 :014 > article.source
 => "国内 - Yahoo!ニュース" 
1.9.3-p448 :015 > article.date
 => 2013-10-07 20:20:05 UTC 
1.9.3-p448 :016 > article.title
 => "（ニュースＱ３）演劇の夜公演激減…でも料金はお得に！（朝日新聞デジタル）" 
1.9.3-p448 :017 > article.category
 => "（ニュースＱ３）演劇の夜公演激減…でも料金はお得に！（朝日新聞デジタル）" 
1.9.3-p448 :018 > article.text
 => "\n　演劇などの舞台で、これまで少なかった昼公演が最近、圧倒的に増えている。これでは会社員や学生らが見に来られなくなると、夜公演の入場料の値下げも相次ぐ。なぜなのか？\n　■客も高齢化、昼公演が中心\n　彩の国さいたま芸術劇場（さいたま市）で先月上演された市川猿之助さん主演「ヴェニスの商人」は、全２０回の７５％に当たる１５回を昼公演が占めた。\n　同劇場で上演中の藤原竜也さん主演「ムサシ　ロンドン・ＮＹバージョン」は、２６回のうち１７回（６５％）が昼公演だ。\n　新劇の老舗・劇団民芸が東京・新宿で先月上演した「集金旅行」は、１３回のうち１０回が昼公演だった。……本文：1,298文字\nこの記事の続きをお読みいただくには、朝日新聞デジタルselect on Yahoo!ニュースの購入が必要です。\n" 
1.9.3-p448 :019 > article.length
 => 346 
1.9.3-p448 :020 > article.kanji_hash
 => {"演"=>12, "劇"=>5, "舞"=>1, "台"=>1, "少"=>1, "昼"=>5, "公"=>6, "最"=>1, "近"=>1, "圧"=>1, "倒"=>1, "的"=>1, "増"=>1, "会"=>1, "社"=>1, "員"=>1, "学"=>1, "生"=>1, "見"=>1, "来"=>1, "夜"=>1, "入"=>2, "場"=>3, "料"=>1, "値"=>1, "下"=>1, "相"=>1, "次"=>1, "客"=>1, "高"=>1, "齢"=>1, "化"=>1, "中"=>2, "心"=>1, "彩"=>1, "国"=>1, "芸"=>2, "術"=>1, "市"=>2, "先"=>2, "月"=>2, "上"=>3, "川"=>1, "猿"=>1, "之"=>1, "助"=>1, "主"=>2, "ヴ"=>1, "商"=>1, "人"=>1, "全"=>1, "回"=>6, "当"=>1, "占"=>1, "同"=>1, "藤"=>1, "原"=>1, "竜"=>1, "也"=>1, "Ｎ"=>1, "Ｙ"=>1, "ョ"=>1, "新"=>3, "老"=>1, "舗"=>1, "団"=>1, "民"=>1, "東"=>1, "京"=>1, "宿"=>1, "集"=>1, "金"=>1, "旅"=>1, "行"=>1, "本"=>1, "文"=>2, "字"=>1, "記"=>1, "事"=>1, "続"=>1, "読"=>1, "朝"=>1, "日"=>1, "聞"=>1, "ュ"=>1, "購"=>1, "必"=>1, "要"=>1} 
1.9.3-p448 :021 > 
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Next major step:
Fix category variable for Article
Add additional news sources
