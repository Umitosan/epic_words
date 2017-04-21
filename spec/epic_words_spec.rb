require "spec_helper"

RSpec.describe EpicWords do
  describe 'EpicWords#compare' do
    let(:words) { EpicWords.new}
    it 'returns an error if both words are not words' do
      expect(words.compare('blarp', 'poit')).to match(/Error:/)
    end

    it 'if given two anagrams, return a string which says they are anagrams' do
      expect(words.compare('cat', 'act,')).to match(/are anagrams/)
    end

    it 'if given two valid words which are not anagrams, return a string message to that effect' do
      expect(words.compare('cat', 'art')).to match(/not anagrams/)
    end

    it 'will match anagrams case-insensitively' do
      expect(words.compare('cat', 'ACT')).to match(/are anagrams/)
    end

    it 'will indicate if words are antigrams' do
      expect(words.compare('cat', 'ruby')).to match(/are antigrams/)
    end

    it 'will indicate whether the words are palindromes' do
      expect(words.compare('racecar', 'racecar')).to match(/palindrome/)
    end

    it 'will match multiple words as being antigrams or anagrams' do
      expect(words.compare('Internet Anagram Server', 'I, Rearrangement Servant')).to match(/are anagrams/)
    end
  end
end
