class PaidOut < ActiveRecord::Base
  # attr_accessible :title, :body
   resourcify
  belongs_to :users
#  after_initialize :init
#  def init
#    #self.count ||= 15
#    self.user_id ||= current_user.id
#    #self.cancel_item ||= false
#  end
end
