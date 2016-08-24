class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, ImageUploader
  
  validates :picture, presence: true
end
