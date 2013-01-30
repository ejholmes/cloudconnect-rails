# CloudConnect Rails

A set of helpers to make it easier to work with CloudConnect managed databases
in rails.

## Installation

Add this line to your application's Gemfile:

    gem 'cloudconnect-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudconnect-rails

## Usage

Include the `CloudConnect` module in your `ActiveRecord` models:

```ruby
class Account < ActiveRecord::Base
  include CloudConnect
end
```

### multipicklist(column)

Specify the field as a multipicklist field, which will properly serialize ruby
arrays to the Salesforce storage format ('Ferrari;Toyota;Honda').

```ruby
class Account < ActiveRecord::Base
  include CloudConnect

  multipicklist :Cars__c
end

account = Account.new(cars: ['Honda'])
account.reload
account.cars
# => ['Honda']
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
