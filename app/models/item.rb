class Item < ActiveRecord::Base
  validates :name, presence: true

  mount_uploader :picture, ItemPictureUploader
end
