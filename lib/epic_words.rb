require 'epic_anagram'
require 'set'

class EpicWords
  def compare(first, second)
    message = ''
    string1, string2 = [first,second].map {|s| s.downcase.gsub(/\W+/, '')}
    message << "These words are palindromes.\n" if are_palindromes?(string1, string2)
    message << "These words are antigrams.\n" if are_antigrams?(string1, string2)
    if are_anagrams?(string1, string2)
      message << "These words are anagrams\n" 
    end
    message.empty? ? 'Error: these words are not anagrams, palindromes, or antigrams' : message
  end

  def are_antigrams?(*args)
    # map/reduce strikes again
    # Set is the proper class to use for this
    # the & operator returns the set intersection
    # if the set intersection is empty the words share no characters
    args.map {|e| Set.new(e.split(''))}.reduce(&:&).empty?
  end

  def are_palindromes?(first, second)
    first.reverse == first && second.reverse == second
  end

  def are_anagrams?(*args)
    # for all inputs, split them to an array, and return an array of the sorted characters
    # then find out how many unique arrays we have
    # the words are all anagrams IFF we have an array of length 1
    args.map { |e| e.split('').sort}.uniq.length == 1
  end

  def anagrams(word)
    EpicAnagram.find_anagrams(word)
  end
end
