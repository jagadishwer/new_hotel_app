# == Schema Information
#
# Table name: kitchens
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  counter_id  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class KitchenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end