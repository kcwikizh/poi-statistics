require 'sinatra/base'

module Sinatra
  module KVDataHelper
    def self.get_kv_data(key)
      return nil unless KVData.exists?(:key => key)
      KVData.where(:key => key).take.value
    end
    
    def self.set_kv_data(key, value = nil)
      value = block_given? ? yield : value
      KVData.create(:key => key, :value => value)
      value
    end
  end

  helpers KVDataHelper
end
