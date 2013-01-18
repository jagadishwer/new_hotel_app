class CounterOrder < ActiveRecord::Base
  #attr_accessible :quantity
  validates :quantity, :presence=>true
 after_initialize :init
  def init
    self.status||=0
  end
  def itemname
    Item.find(self.item_id).item_name
  end
end
