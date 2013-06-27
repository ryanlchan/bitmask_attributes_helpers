BitmaskAttributesHelpers
========================

Quick and simple helpers for Joel Moss' bitmask_attributes gem. These
helpers include frequently used checkers, setters, getters, and scopes
pertaining to the bitmasks.


## Installation ##

The best way to install is with RubyGems:

    $ [sudo] gem install bitmask_attributes_helpers

Or better still, just add it to your Gemfile:

    gem 'bitmask_attributes_helpers'


## Examples/Usage ##

There are four class methods we use to install the requisite helpers:
`bitmask_presence_methods`, `bitmask_scopes`, `bitmask_virtual_attributes`,
and `bitmask_helpers`. Each takes the name of the bitmask as an argument.

```Ruby
  class Model < ActiveRecord::Base
    bitmask :colors, as: [:red, :blue, :green]

    bitmask_presence_methods :colors
    # Enables value checkers, i.e.
    # model.red? => true if model has the red bitmask attribute set

    bitmask_scopes :colors
    # Enables scopes to search Model by bitmask values, i.e.
    # Model.red => all models which have the red bit set to true
    # Model.not_red => all models which have the red bit set to false

    bitmask_virtual_attributes :colors
    # Creates a virtual attribute on the model for each value of the bitmask,
      i.e.
    # model.red = true => sets the red bitmask to true
    # model.red => true, as we've sets the bitmask to true

    bitmask_helpers :colors
    # This is a macro to enable all of the above for a specific bitmask
  ...
```

## Contributing ##

1. Fork it.
2. Create a branch (`git checkout -b new-feature`)
3. Make your changes
4. Run the tests (`bundle install` then `bundle exec rake`)
5. Commit your changes (`git commit -am "Created new feature"`)
6. Push to the branch (`git push origin new-feature`)
7. Create a [pull request](http://help.github.com/send-pull-requests/) from your branch.
8. Promote it. Get others to drop in and +1 it.


## Credits ##

[Joel Moss](https://github.com/joelmoss) deserves all the credit for his wonderful bitmask_attributes gem

## Copyright ##

Copyright (c) 2013 Ryan Chan
