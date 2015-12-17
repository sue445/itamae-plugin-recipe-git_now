# Itamae::Plugin::Recipe::GitNow

[Itamae](https://github.com/itamae-kitchen/itamae) plugin to install [git-now](https://github.com/iwata/git-now)

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-git_now.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-git_now)
[![Dependency Status](https://gemnasium.com/sue445/itamae-plugin-recipe-git_now.svg)](https://gemnasium.com/sue445/itamae-plugin-recipe-git_now)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-git_now'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-git_now

## Usage

### Recipe
```ruby
# recipe.rb

# itamae v1.5.2 or later
include_recipe "git_now"

# older
include_recipe "git_now::default"
```

### Node
```yml
# node.yml
git_now:
  # tig prefix (default: /usr/local)
  prefix: /usr/local
  
  # source dir (default: #{node[:git_now][:prefix]}/src)
  src: /usr/local/src
  
  # specify scheme to use in git clone (default: git)
  scheme: git

  # install revision (default: HEAD)
  revision: v0.1.1.0
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/itamae-plugin-recipe-git_now.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

