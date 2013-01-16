class InternalOrder < ActiveRecord::Base
  # attr_accessible :title, :body
 belongs_to :stock_list_items
 validates :quantity, :presence=> true
 after_initialize :init
 def init
   self.status||=0
 end
 
end
