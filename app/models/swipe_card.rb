# == Schema Information
#
# Table name: swipe_cards
#
#  id         :integer          not null, primary key
#  card_no    :string(255)
#  balance    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SwipeCard < ActiveRecord::Base
  attr_accessible :card_no
  has_many :transactions
  validates :card_no, :uniqueness => true
  
end
