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
   resourcify
   attr_accessible :stock_list_item_id, :mrp, :quantity
  belongs_to :stock_count
  belongs_to :stock_list_item
  belongs_to :users
  #after_initialize :init
  #def init
    #self.count ||= 15
    #self.user_id ||= current_user.id
    #self.cancel_item ||= false
  #end
end
