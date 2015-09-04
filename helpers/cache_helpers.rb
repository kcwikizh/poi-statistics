require 'sinatra/base'
require 'mini_cache'

module Sinatra
  module CacheHelper
    @@store = MiniCache::Store.new

    def cache_get(key)
      @@store.get(key)
    end

    def cache_set(key, value)
      @@store.set("#{key}_timestamp", Time.now.to_f)
      @@store.set(key, value)
    end

    def cache_get_or_set(key, timestamp, value = nil)
      return @@store.get(key) if @@store.set?(key) && (@@store.get("#{key}_timestamp") >= timestamp)
      @@store.set("#{key}_timestamp", Time.now.to_f)
      @@store.set(key, block_given? ? yield : value)
    end

    def cache_get_or_return(key, timestamp, value = nil)
      return @@store.get(key) if @@store.set?(key) && (@@store.get("#{key}_timestamp") >= timestamp)
      block_given? ? yield : value
    end
  end

  helpers CacheHelper
end
