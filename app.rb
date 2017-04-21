# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bundler/setup'
require 'sinatra'
require 'epic_words'

if development?
  require 'sinatra/reloader'
  require 'pry'
  also_reload('**/*.rb')
end


get('/') do
  erb(:index)
end

post('/compare') do
  @ew ||= EpicWords.new
  word1 = params.fetch('word1')
  word2 = params.fetch('word2')
  @result = @ew.compare(@word1, @word2)
  erb(:index)
end

post ('/anagrams') do
  @ew ||= EpicWords.new
  @word = params.fetch('anagram')
  @result = @ew.anagrams(@word)
end
