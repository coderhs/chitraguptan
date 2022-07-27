require 'chitraguptan/engine'
require 'chitraguptan/config'
require 'chitraguptan/main'
require 'redis'

module Chitraguptan
  class << self
    attr_writer :redis, :prefix, :persist, :disable_auto_load
    attr_reader :redis, :prefix, :persist, :disable_auto_load

    def load
      @load ||= begin
        load_object
        true
      end
    end

    def configure
      yield self if block_given?
    end

    def get(key, default: nil)
      load_object.get(key, default)
    end

    alias_method :set, :get

    def delete(key)
      load_object.get(key)
    end

    def update(key, value: )
      load_object.update(key, value)
    end

    def show_all
      load_object.all
    end

    def delete_all
      load_object.delete_all
    end

    def load_object
      @object ||= Chitraguptan::Main.new(Chitraguptan::Config.new(redis, prefix, persist))
    end
  end
end
