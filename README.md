# variety-format-logger
[![Gem Version](https://badge.fury.io/rb/variety-format-logger.svg)](https://badge.fury.io/rb/variety-format-logger)
[![Build Status](https://travis-ci.org/naoto0822/variety-format-logger.svg?branch=master)](https://travis-ci.org/naoto0822/variety-format-logger)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/naoto0822/variety-format-logger/blob/master/LICENSE.txt)

output is Default or JSON or LTSV format.

## Installation

```ruby
gem 'variety-format-logger'
```

## Usage

### Default

```ruby
path = "./default.log"
logger = VarietyFormat::Logger.new(path)
logger.debug("sample logger")
```

output is following

```
D, [2017-12-20T00:09:21.549282 #5706] DEBUG -- : sample logger
```

### JSON

```ruby
path = "./json.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::JSON_FORMAT
msg = {}
msg["k1"] = "v1"
msg["k2"] = "v2"
msg["k3"] = "v3"
logger.debug(msg)
```

output is following

```
{"k1":"v1","k2":"v2","k3":"v3"}
```

### LTSV

```ruby
path = "./ltsv.log"
logger = VarietyFormat::Logger.new(path)
logger.format_type = VarietyFormat::Logger::LTSV_FORMAT
msg = {}
msg["gender"] = "male"
msg["age"] = 20
msg["birth"] = "1990/08/22"
msg["json"] = {"k1": "v1"}.to_json
logger.debug(msg)
```

output is following

```
gender:male	age:20	birth:1990/08/22	json:{"k1":"v1"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/variety-format-logger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Variety::Format::Logger project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/variety-format-logger/blob/master/CODE_OF_CONDUCT.md).
