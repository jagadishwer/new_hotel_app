class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :fax_no, :phone_no, :title
end
