require 'sinatra/base'

module Sinatra
  module KVDataHelper
    def self.get_or_set_kv_data(key, value = nil)
      return KVData.where(:key => key).take.value if KVData.exists?(:key => key)
      value = block_given? ? yield : value
      KVData.create(:key => key, :value => value)
      value
    end
  end

  helpers KVDataHelper
end
