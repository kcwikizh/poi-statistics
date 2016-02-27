require 'sinatra/base'

module Sinatra
  module DevelopmentQueryHelper
    def get_development_pool_name(time = Time.now)
      self.get_default_pool(time)
    end

    class << self
      def get_development_pool_name(time = Time.now)
        "Base150803"
      end
    end
  end

  helpers DevelopmentQueryHelper
end
