# OmniAuth OpenStreetMap strategy via OAuth2

This gem contains the OpenStreetMap OAuth2 strategy for OmniAuth.

OpenStreetMap recommends the OAuth2 flow. see: https://wiki.openstreetmap.org/wiki/OAuth

Originally developed by omniauth-osm (https://github.com/sozialhelden/omniauth-osm)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-osm-oauth2'
```

And then execute:

    $ bundle install

If you don't have an OpenStreetMap logo handy you may wish to drop `openstreetmap.svg` into your asset pipeline. 

## Usage

`OmniAuth::Strategies::OsmOauth2` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/omniauth/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :osm_oauth2, ENV['OSM_APP_ID'], ENV['OSM_APP_SECRET']
end
```


## Configuring

TODO: Write usage instructions here



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-osm-oauth2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/omniauth-osm-oauth2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Osm::Oauth2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-osm-oauth2/blob/master/CODE_OF_CONDUCT.md).
