class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :images_attributes
  has_many :images, :as => :imagable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
end
