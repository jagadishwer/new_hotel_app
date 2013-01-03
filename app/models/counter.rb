# == Schema Information
#
# Table name: counters
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Counter < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :items
  has_many :orders
  has_many :customers
end
