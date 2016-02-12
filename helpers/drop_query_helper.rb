require 'sinatra/base'
require_relative '../models/KanColleConstant_area'
require_relative '../models/KanColleConstant_event'

module Sinatra
  module DropQueryHelper
    def get_default_pool(time)
      self.get_default_pool(time)
    end

    def get_event_pool(time)
      self.get_event_pool(time)
    end

    class << self
      def get_default_pool(time)
        return {
          name: "Base150803",
          map: KanColleConstant.area.flat_map{|k, v| v[:event] ? [] : v[:maps]} - get_event_pool(time)[:map]
        }

      end

      def get_event_pool(time)
        time ||= Time.now

        KanColleConstant.event.each do |evt|
          if time > evt[:from_time] && time < evt[:to_time]
            return {
              name: evt[:name],
              map: evt[:map]
            }
          end
        end

        return {
          name: "",
          map: []
        }
      end
    end
  end

  helpers DropQueryHelper
end
