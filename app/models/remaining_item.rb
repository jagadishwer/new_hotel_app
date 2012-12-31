# == Schema Information
#
# Table name: remaining_items
#
#  id                 :integer          not null, primary key
#  stock_list_item_id :integer
#  stock_count_id     :integer
#  quantity           :integer
#  mrp                :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class RemainingItem < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :stock_count
  belongs_to :stock_list_item
end
