# Garage::Doorkeeper

A authenticatino/authorization extension for [Garage gem](https://github.com/cookpad/garage)
to integrate [Doorkeeper gem](https://github.com/doorkeeper-gem/doorkeeper).
Garage is a Rails extension for RESTful Hypermedia API.

## Doorkeeper compatibility
- Use garage-doorkeeper v1.x with doorkeeper v1.x.
- Use garage-doorkeeper v2.x with doorkeeper v2.x.

garage-doorkeeper v1 keeps compatibility with doorkeeper v1.x, actually
">= 0.6.7" and "< 1.5.0". garage-doorkeeper v2 keeps compatibility with
doorkeeper v2.x, actually ">= 2.0.0".

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'garage-doorkeeper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garage-doorkeeper

## Usage

In `config/initializer/garage.rb`:

```ruby
Garage.configuration.strategy = Garage::Strategy::Doorkeeper

# Then configure doorkeeper if you didn't.
Doorkeeper.configure do
  #...
end
```

Then Garage will authenticate/authorize requests using doorkeeper feature.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/garage-doorkeeper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
