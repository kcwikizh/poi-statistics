require 'sinatra/base'

module Sinatra
  module KVDataHelper
    def self.get_kv_data(key)
      return nil unless KVData.exists?(:key => key)
      KVData.where(:key => key).take.value
    end

    def self.set_kv_data(key, value = nil)
      value = block_given? ? yield : value
      if KVData.exists?(:key => key)
        kv = KVData.where(:key => key).take
        kv.value = value
        kv.save
      else
        KVData.create(:key => key, :value => value)
      end
      value
    end

    def get_kv_data(key)
      KVDataHelper.get_kv_data(key)
    end

    def set_kv_data(key, value)
      KVDataHelper.set_kv_data(key, value)
    end
  end

  helpers KVDataHelper
end
