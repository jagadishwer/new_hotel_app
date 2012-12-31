class Image < ActiveRecord::Base
  
  attr_accessible :photo
  belongs_to :imagable, :polymorphic => true
  mount_uploader :photo, PhotoUploader
end
