require 'sinatra/base'
require 'mini_cache'

module Sinatra
  module CacheHelper
    @@store = MiniCache::Store.new

    def get(key)
      @@store.get(key)
    end

    def get_or_set(key, timestamp, value = nil)
      return @@store.get(key) if @@store.set?(key) && (@@store.get("#{key}_timestamp") >= timestamp)
      @@store.set(key, block_given? ? yield : value)
      @@store.set("#{key}_timestamp", Time.now.to_i)
    end
  end

  helpers CacheHelper
end
