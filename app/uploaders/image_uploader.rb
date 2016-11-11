class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave
  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  def store_dir
    "shafa_images/"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
