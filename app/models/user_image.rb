class UserImage < ActiveRecord::Base
  # Tells rails to use this uploader for this model.
  mount_uploader :attachment, UserImageUploader

  # Make sure the owner's name is present.
  validates :name, presence: true
end
