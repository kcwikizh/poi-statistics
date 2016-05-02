require 'sinatra/base'
require_relative '../models/KanColleConstant_area'
require_relative '../models/KanColleConstant_event'

module Sinatra
  module DropQueryHelper
    def self.get_default_drop_pool(time)
      return {
        name: "Base160422",
        map: KanColleConstant.area.flat_map{|k, v| v[:event] ? [] : v[:maps]} - self.get_event_drop_pool(time)[:map]
      }
    end

    def self.get_event_drop_pool(time)
      time ||= Time.now

        KanColleConstant.event.each do |evt|
          if time >= evt[:from_time] && time < evt[:to_time]
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

  helpers DropQueryHelper
end
