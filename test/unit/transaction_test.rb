# == Schema Information
#
# Table name: transactions
#
#  id                  :integer          not null, primary key
#  swipe_card_id       :integer
#  counter_id          :string(255)
#  cost                :string(255)
#  type_of_transaction :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  balance             :float
#

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
