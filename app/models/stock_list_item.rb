# == Schema Information
#
# Table name: stock_list_items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StockListItem < ActiveRecord::Base
  # attr_accessible :title, :body
 #
 #attr_accessible :delivery_items_attributes
  has_many :stock_counts, :through=>:remaining_items
  has_many :remaining_items

  has_many :deliveries, :through=>:delivery_items
  has_many :delivery_items
  accepts_nested_attributes_for :delivery_items, :allow_destroy => true

  
end
