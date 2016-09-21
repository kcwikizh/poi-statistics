require 'json'

class ConstData
  class ShipData
    def initialize
      @data = JSON.parse(File.read("#{File.dirname(__FILE__)}/../data/ship.json"))
    end

    def [](index)
      if index == -1
        return {"name" => "(无)"}
      elsif index.is_a? Numeric
        return @data.find{|i| i["id"] == index}
      elsif index.is_a? String
        return @data.find{|i| i["name"] == index}
      else
        return {"name" => "未知"}
      end
    end
  end

  class ShipTypeData
    def initialize
      @data = JSON.parse(File.read("#{File.dirname(__FILE__)}/../data/shiptype.json"))
    end

    def [](index)
      if index.is_a? Numeric
        return @data.find{|i| i["id"] == index}
      elsif index.is_a? String
        return @data.find{|i| i["name"] == index}
      else
        return nil
      end
    end
  end

  class ShipClassData
    def initialize
      @data = JSON.parse(File.read("#{File.dirname(__FILE__)}/../data/shipclass.json"))
    end

    def [](index)
      return @data.find{|i| i["id"] == index}
    end
  end

  class SlotItemData
    def initialize
      @data = JSON.parse(File.read("#{File.dirname(__FILE__)}/../data/slotitem.json"))
    end

    def [](index)
      if index.is_a? Numeric
        return @data.find{|i| i["id"] == index}
      elsif index.is_a? String
        return @data.find{|i| i["name"] == index}
      else
        return nil
      end
    end
  end

  class << self
    def ship
      @@ship ||= ShipData.new
    end

    def shiptype
      @@shiptype ||= ShipTypeData.new
    end

    def shipclass
      @@shipclass ||= ShipClassData.new
    end

    def slotitem
      @@slotitem ||= SlotItemData.new
    end
  end
end