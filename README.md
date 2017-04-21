# EpicWords

This application will tell the user whether two words are palindromes, anagrams, or 'antigrams'. It will also generate anagrams for a given word. It relies upon the [`epic_anagram` gem](https://github.com/tenebrousedge/epic_anagram), and the anagram generation will likely fail on Windows systems due to `/usr/share/dict/words` not being present.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'epic_words'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install epic_words

## Usage

Run `ruby app.rb` and open `localhost:4567` in your web browser. Note that finding palindromes for a word takes several seconds.

The app is also (for the time being) available at: [https://sheltered-mountain-52011.herokuapp.com/]

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tenebrousedge/epic_words.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

