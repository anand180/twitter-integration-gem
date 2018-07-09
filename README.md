# Twitter Integration

A barebones gem for application-only Twitter integration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twitter_integration'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter_integration

## Usage

This gem uses Dotenv (https://github.com/bkeepers/dotenv) for environment variables. Add a .env file to your application with your Twitter application's consumer key and consumer secret, with the keys TWITTER_CONSUMER_KEY and TWITTER_CONSUMER_SECRET, and add .env to your .gitignore.

This gem is for application-only GET requests to the Twitter API.

In your application, instantiate a new TwitterHandler object. All requests to the Twitter API that are supported by this gem are exposed on instances of TwitterHandler. Methods take a screen name and sometimes optional parameters, and return an OpenStruct with a success value and the payload already parsed from the JSON.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Maintenance

This gem is for learning purposes only and is not being maintained.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
