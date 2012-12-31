class Counter < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :items
  has_many :orders
  has_many :customers
end
