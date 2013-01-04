class Supplier < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :stock_list_items, :through=>:supplies
  has_many :supplies
  has_many :deliveries
end
