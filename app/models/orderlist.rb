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
#

class Orderlist < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :orders
  belongs_to :items
  after_initialize :init
  def init
    #self.count ||= 15
    self.cancel_item ||= false
  end
def itemname
  Item.find(self.item_id).item_name
end
end
