require 'epic_anagram'
require 'set'

# This class allows people to do fun things with words
# It should maybe be a module instead
class EpicWords
  # This module exists because it's slightly more readable to type 
  # strings.are_palindromes?
  # rather than 
  # are_palindromes?(strings)
  module WordFunctions
    # compares an array of words to see if they are all antigrams
    # @return [Boolean]
    def are_antigrams?
      # map/reduce strikes again
      # Set is the proper class to use for this because it will automagically eliminate duplicate characters
      # the & operator returns the set intersection
      # if the set intersection is empty the words share no characters
      self.map {|s| Set.new(s.split(''))}.reduce(&:&).empty?
    end

    # compares an array of words to see if they are all palindromes
    #
    # this could have been written to test if all strings are palindromes of each other, but this is easier
    # @return [Boolean]
    def are_palindromes?
      self.all? {|s| s == s.reverse }
    end

    # compares an array of words to see if they are all anagrams of each other
    # @return [Boolean]
    def are_anagrams?
      # for all inputs, split them to an array, and return an array of the sorted characters
      # then find out how many unique arrays we have
      # the words are all anagrams IFF we have an array of length 1
      self.map { |s| s.split('').sort}.uniq.length == 1
    end
  end

  # Compares strings to see if they are palindromes, antigrams, or anagrams
  #
  # 
  # @param [Array<String>] *strings Any number of strings to compare
  # @return [String]
  def compare(*strings)
    # downcases all strings and strips out non-alphanumeric characters
    strings.map! {|s| s.downcase.gsub(/\W+/, '')}
    # 
    strings.extend(WordFunctions)
    # we use the case statement as a shorthand way of writing a bunch of if/else statements
    # ruby is interesting in that:
    # 1. conditional statements return expressions
    # 2. case statements don't need to evaluate anything when initially declared
    types = [] << case
    when strings.are_palindromes?
      "palindromes"
    when strings.are_antigrams?
      "antigrams"
    when strings.are_anagrams?
      "anagrams"
    end
    # any? as opposed to empty? because case will return nil by default
    if types.any?
      # writing it like this avoids duplicating the string
      types.reduce('') {|acc, e| acc += "These words are #{e}\n"}
    else
      'Error: these words are not anagrams, palindromes, or antigrams'
    end
  end

  # finds anagrams for a given word. Function provided by the EpicAnagram gem
  #
  # @link https://github.com/tenebrousedge/epic_anagram
  # @param [String] word A word to find anagrams for
  # @return [String]
  def anagrams(word)
    EpicAnagram.find_anagrams(word)
  end
end
