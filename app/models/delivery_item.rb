# == Schema Information
#
# Table name: delivery_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  delivery_id        :integer
#  mrp                :float
#  quantity           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DeliveryItem < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :stock_list_item
  #attr_accessor :item_name
  belongs_to :delivery
  belongs_to :stock_list_item
  def item_name=(x)
    @s= StockListItem.create(:name=>x)
    @s.delivery_item<<self
  end
  def item_name

  end
end
