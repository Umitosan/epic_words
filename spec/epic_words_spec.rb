require "spec_helper"

RSpec.describe EpicWords do
  it "has a version number" do
    expect(EpicWords::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe 'EpicWords#compare' do
    it 'returns an error if both words are not words' do
      expect(EpicWords.compare('blarp', 'poit')).to match(/Error:/)
    end

    it 'if given two anagrams, return a string which says they are anagrams' do
      expect(EpicWords.compare('cat', 'act')).to match(/are anagrams/)
    end

    it 'if given two valid words which are not anagrams, return a string message to that effect' do
      expect(EpicWords.compare('cat', 'art')).to match(/not anagrams/)
    end

    it 'will match anagrams case-insensitively' do
      expect(EpicWords.compare('cat', 'ACT')).to match(/are anagrams/)
    end

    it 'will indicate if words are antigrams' do
      expect(EpicWords.compare('cat', 'ruby')).to match(/are antigrams/)
    end

    it 'will indicate whether the words are palindromes' do
      expect(EpicWords.compare('racecar', 'racecar')).to match(/palindrome/)
    end

    it 'will match multiple words as being antigrams or anagrams' do
      expect(EpicWords.compare('Internet Anagram Server', 'I, Rearrangement Servant')).to match('/are anagrams/')
  end
end
