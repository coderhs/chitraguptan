# Project Chitraguptan

## Project Plan

Meaning: Hindu god/divine figure who is assigned with the task of record keeping

This is an app to develop the dynamic variable manager for Rails.

We save some values as constant in a rails model

``` rb
class RfidTag < ActiveModel
  def self.filter_weak_rssi
    where('rssi < 100')
  end
end
```

Similarly we might code hard values at different parts of the app. To make this
configurable we enter the values into the config file, env file, or store it in
a model in the DB.

So they can be used as:

```rb
  where('rssi < ?', ENV['WEAK_RSSI'])
  # or
  where('rssi < ?', Rails.configuration.custom_config.weak_rssi)
  # or
  where('rssi < ?', RfidSetting.first.weak_rssi)
```

The first two of the above, requires re-deploying our rails app, and committing or changing files.
The last one requires creating and maintaining an extra model. But it does allow
one to change the variables on the file.

The aim of this project is to reduce the burden of managing variables. It is especially useful in building simple feature toggles.

```rb
  where('rssi < ?', Chitraguptan.get("week_rssi", default: 100))
```

Now this variable will be set as `chitraguptan:week_rssi` in your redis database and also
stored in your database inside the table: chitraguptan_variables. The table has 3 fields namely, id, key and value (int 32, varchar and jsonb). 

## Current ADMIN UI

![image](https://user-images.githubusercontent.com/979321/180947183-cc861cb1-c38e-4179-86dc-35079e1145d8.png)

## Installation

Disclaimer: Currently this project is in active development.

To install this gem add the following to your Gemfile.

```rb
gem 'chitraguptan', github: 'coderhs/chitraguptan'
```

then run `bundle install`

followed by

```sh
bundle exec rails generate chitraguptan:install
```

This will add an initializer file and admin url to your application routes.

The values you can control from initializer files are:
```rb
config.redis            = Redis.new # Provide connection string to your local or remote redis host
config.prefix           = 'chitraguptan' # We use the prefix to namespace the variables inserted and managed by the gem.
config.persist          = false # Persist flag will auto save all variables to your database, thus safeguarding it from a redis restart or crash
config.do_not_auto_load = true  # Auto load the existing value in the DB to redis on boot
```

If you are enabling the persist flag, you will need to add the migration to your rails app.

```sh
bundle exec rails generate chitraguptan:migrations
```

## Purpose of this repo

Build the whole feature inside this repo and then extract it to a gem

## Things to do

1. Connect to redis - https://github.com/coderhs/chitraguptan/labels/Done
2. Configure to add prefix to the variables used - https://github.com/coderhs/chitraguptan/labels/Done
3. Define api to set data, delete data and give default if data doesn't exist - https://github.com/coderhs/chitraguptan/labels/Done
4. Load existing variables and set them in redis if they don't exist (during boot) - https://github.com/coderhs/chitraguptan/labels/Done
5. Admin UI to CRUD manage the variables - https://github.com/coderhs/chitraguptan/labels/Done
6. Extract the code to its own gem - https://github.com/coderhs/chitraguptan/labels/Done
7. Add to admin UI - Delete key
8. Create gem install scripts - https://github.com/coderhs/chitraguptan/labels/Done
   1. Create migration to persist data - https://github.com/coderhs/chitraguptan/labels/Done
   2. Create initializer file -  https://github.com/coderhs/chitraguptan/labels/Done
   3. Add engine route to rails app routes
9. Move get/set/delete/update to its own service classes
10. Write test for whole code
11. Control following settings from initializer
   1. Redis URL
   2. Auto persistance of variables - https://github.com/coderhs/chitraguptan/labels/Done
   3. Auto load for variables during boot - https://github.com/coderhs/chitraguptan/labels/Done
   4. Disable persistance in DB - https://github.com/coderhs/chitraguptan/labels/Done
12. Write more API documentation
13. Release the gem to rubygems

## Nice to have

1. Load the list of variables from file (to use without the DB)
