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

The first two, requires re-deploying our rails app, and committing or changing files.
The last one requires you to create and maintain an extra model, but it does allow
one to change the variables on the file.

The aim of this project is to reduce the burden of managing variables. It is especially useful in building feature simple feature toggles.

```rb
  where('rssi < ?', Chitraguptan.get("week_rssi", default: 100))
```

Now this variable will be set as `chitraguptan:week_rssi` in your redis database and also
stored in your database inside the table: chitraguptan_variabels. The table has 3 fields:
id, key, value  - (int 32, varchar, jsonb)

## Current ADMIN UI

![image](https://user-images.githubusercontent.com/979321/180947183-cc861cb1-c38e-4179-86dc-35079e1145d8.png)


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
8. Create gem install scripts
   1. Create migration to persist data
   2. Create initializer file
   3. Add engine route to rails app routes
9. Move get/set/delete/update to its own service classes
10. Write test for whole code
11. Control following settings from initializer
   1. Redis URL
   2. Auto persistance of variables
   3. Auto load for variables during boot
   4. Disable persistance in DB
12. Write more API documentation
13. Release the gem to rubygems

## Nice to have

1. Load the list of variables from file (to use without the DB)
