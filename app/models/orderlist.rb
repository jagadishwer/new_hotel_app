# == Schema Information
#
# Table name: orderlists
#
#  id          :integer          not null, primary key
#  order_id    :integer
#  item_id     :integer
#  quantity    :integer
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cancel_item :boolean
#  counter_id  :integer
#  user_id     :integer
#

class Orderlist < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
  belongs_to :orders
  belongs_to :items
    belongs_to :users
 after_initialize :init
 def init
  #self.count ||= 15
#    self.user_id ||= current_user.id
 self.cancel_item ||= false
 end
def itemname
  Item.find(self.item_id).item_name
end
end
