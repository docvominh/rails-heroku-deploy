# encoding: utf-8

class UserImageUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads/user_images"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
