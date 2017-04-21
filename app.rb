require 'sinatra'
require 'epic_words'

if development?
  require 'sinatra/reloader'
  also_reload('**/*.rb')
end

get('/') do
  erb(:index)
end

post('/compare') do
  word1 = params.fetch('word1')
  word2 = params.fetch('word2')
  @result = EpicWords.compare(@word1, @word2)
  erb(:index)
end