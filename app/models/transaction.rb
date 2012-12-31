class Transaction < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :swipe_card
  def card
    (SwipeCard.find(self.swipe_card_id)).card_no
  end
  def counter
    (Counter.find(self.counter_id)).name
  end
  def transaction_type
    case self.type_of_transaction
    when 1
      "credit"
    when 2
       "debit"
    else
       "unknown"
    end
  end
#  def remaining
#    (SwipeCard.find(self.swipe_card_id)).balance
#  end
end
