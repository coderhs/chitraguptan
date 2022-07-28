module Chitraguptan
  class Config
    def initialize(redis = Redis.new,
                   prefix='chitraguptan',
                   persist=true,
                   disable_auto_load=true)
      @redis             = redis
      @prefix            = prefix
      @persit            = persist
      @disable_auto_load = disable_auto_load
    end

    attr_reader :redis, :prefix, :persist, :disable_auto_load
  end
end
