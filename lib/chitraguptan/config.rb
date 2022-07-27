module Chitraguptan
  class Config
    def initialize(redis = Redis.new,
                   prefix='chitraguptan',
                   persist=true,
                   do_not_auto_load=true)
      @redis            = redis
      @prefix           = prefix
      @persit           = persist
      @do_not_auto_load = do_not_auto_load
    end

    attr_reader :redis, :prefix, :persist, :do_not_auto_load
  end
end
