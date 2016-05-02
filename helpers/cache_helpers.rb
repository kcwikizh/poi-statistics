require 'sinatra/base'
require 'mini_cache'

module Sinatra
  module CacheHelper
    @@store = MiniCache::Store.new

    def self.cache_get(key)
      @@store.get(key)
    end

    def self.cache_set(key, value = nil)
      @@store.set(key, block_given? ? yield : value)
    end

    def self.cache_get_or_set(key, value = nil)
      return @@store.get(key) if @@store.set?(key)
      @@store.set(key, block_given? ? yield : value)
    end

    def self.cache_clear
      @@store.reset
    end
  end

  helpers CacheHelper
end
