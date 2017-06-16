# Rzman: Ruby Zmanim

RZman is a Ruby CLI Gem that will deliver to you the זמנים(zmanim), daily Jewish prayer times and הדלקת נרות(hadlakat nerot), candle lighting times for Shabbat based on the U.S. zip code you provide.

The data it provides is scraped from MyJewishLearning.com for candle lighting times and MyZmanim.com for daily zmanim.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rzman'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rzman

## Usage

RZman is a very easy Gem to use. Once you run it you will be prompted to choose from two options and then for a valid U.S. zipcode. The program will provide you with the times you requested and prompt you to either return to the main menu or exit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/benhayehudi/rzman. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
