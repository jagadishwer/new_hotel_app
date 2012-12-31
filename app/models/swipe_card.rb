class SwipeCard < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :transactions
end
