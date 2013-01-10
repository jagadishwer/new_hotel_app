# == Schema Information
#
# Table name: salaries
#
#  id              :integer          not null, primary key
#  working_days    :integer
#  basic_salary    :float
#  travel_expense  :float
#  other_expense   :float
#  total_payable   :float
#  day_rate        :float
#  other_decuction :float
#  net_payable     :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Salary < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :employee, :through=>:attendances
  has_many :attendances
end
