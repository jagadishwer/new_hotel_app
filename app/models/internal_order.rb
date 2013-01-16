class InternalOrder < ActiveRecord::Base
  # attr_accessible :title, :body
 
 validates :quantity, :presence=> true
 belongs_to :stock_list_items
 belongs_to :counters
 after_initialize :init
 def init
   self.status||=0
 end
 def item_name
    StockListItem.find(self.stock_list_item_id).name
 end
 def counter_name
   Counter.find(self.counter_id).name
 end
end
