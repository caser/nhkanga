# encoding: utf-8
module Nhkanga
  
  class Article

    attr_accessor :text, :kanji_hash, :url, :source, :title
    attr_accessor :date, :category, :length

    def initialize(link, text)

      # Initialize variables from the link object
      @url = link.url
      @source = link.source
      @date = link.date
      @title = link.title
      @category = link.category

      @text = text
      @length = @text.length

      # Create empty  hash to store kanji & their frequency
      @kanji_hash = {}

      self.create_kanji_hash

    end

    # Create a hash which stores the kanji characters as a key and each character's frequency as a value
    def create_kanji_hash

      # Cycle through all characters in the string and add them to the hash if they are kanji
      @text.each_char do |char|
        # Check if the character in the article is a kanji
        if is_kanji?(char)
          # Add character to hash or increase the kanji count for an existing entry
          unless @kanji_hash[char]
            @kanji_hash[char] = 1
          else
            @kanji_hash[char] += 1
          end
        else
          next
        end
      end

    end

    def is_kanji?(char)

      kanji = true
      rules = [:is_not_a_word_char?, :is_romaji?, :is_hiragana?, :is_katakana?, :is_number?]

      rules.each do |rule|
        if self.send(rule, char)
          kanji = false
        end
      end
      return kanji
      # # Check if character is a non-word character (.,=- etc.)
      # if is_not_a_word_char?(char) || is_romaji?(char) || is_hiragana?(char) ||
      #   is_katakana?(char) || is_number?(char)
      #   kanji = false
      # else
      #   kanji = true 
      # end

      # return kanji

    end

    def is_hiragana?(char)

      # Check if character is included in a list of hiragana
      Hiragana.list.include?(char)

    end

    def is_katakana?(char)

      # Check if character is included in a list of katakana
      Katakana.list.include?(char)

    end

    def is_romaji?(char)

      # Matches if char is a letter from the English alphabet
      char =~ /[a-zA-Z]/

    end

    def is_not_a_word_char?(char)

      # Matches if char is a non-word character (.,-= etc)
      bool = char =~ /\p{Word}+/u
      return !bool

    end

    def is_number?(char)

      # Matches if char is a number
      t1 = char =~ /[0-9]/
      t2 = char =~ /[０-９]/

      return t1 || t2

    end

  end

end