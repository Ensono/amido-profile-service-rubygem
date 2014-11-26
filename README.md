# AmidoProfileService

This gem is used in conjunction with the Amido profile service to persist and retrieve profiles.

## Installation

Add this line to your application's Gemfile:

    gem 'amidoprofileservice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install amidoprofileservice

## Usage

Create a new instance
```ruby
require 'amidoprofileservice'

service = AmidoProfileService.new('subscription_key_here')
```

Then call the API via the following methods

```ruby
service.create_profile('realm_here', 'user_id_here', 'delegate_access_token_here', { :name => 'Peter' })
```


## Contributing

1. Fork it ( https://github.com/amido/amido-profile-service-rubygem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
