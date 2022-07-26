require 'chitraguptan'

Chitraguptan.configure do |config|
  config.redis             = Redis.new
  config.prefix            = 'chitraguptan'
  config.persist           = false
  config.disable_auto_load = true
end

Rails.application.config.after_initialize do
  Chitraguptan.load
end
