require 'epic_anagram'
require 'set'

class EpicWords
  def compare(first, second)
  	if (first.include?(' ') || second.include?(' '))
  		#special case it.
  	end
  	string1, string2 = [first,second].map {|s| s.downcase.gsub(/\W+/, '')}
  	message = ''
  	message << "These words are palindromes.\n" if are_palindromes?(string1, string2)
  	message << "These words are antigrams.\n" if are_antigrams?(string1, string2)
  	message << "These words are anagrams\n" if EpicAnagram.find_anagrams(string1).include?(string2)
  	message.empty? ? 'Error: these words are not anagrams, palindromes, or antigrams' : message
  end

  def are_antigrams?(first, second)
  	[first, second].map {|e| Set.new(e.split(''))}.reduce(&:&).empty?
  end

  def are_palindromes?(first, second)
  	first.reverse == second
  end


end
