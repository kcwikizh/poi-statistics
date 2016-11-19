class DropRecord < ActiveRecord::Base
end

class DropRecordSummer2015 < ActiveRecord::Base
  self.table_name = "drop_records_summer2015"
end


class DropRecordAutumn2016 < ActiveRecord::Base
  self.table_name = "drop_records_autumn2016"
end
