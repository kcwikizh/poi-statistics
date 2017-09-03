class DropRecord < ActiveRecord::Base
end

class DropRecordSummer2015 < ActiveRecord::Base
  self.table_name = "drop_records_summer2015"
end

class DropRecordAutumn2016 < ActiveRecord::Base
  self.table_name = "drop_records_autumn2016"
end

class DropRecordWinter2017 < ActiveRecord::Base
  self.table_name = "drop_records_winter2017"
end

class DropRecordSpring2017 < ActiveRecord::Base
  self.table_name = "drop_records_spring2017"
end

class DropRecordSummer2017 < ActiveRecord::Base
  self.table_name = "drop_records_summer2017"
end
