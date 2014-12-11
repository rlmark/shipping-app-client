class ProductImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :original do
    process :resize_to_fit => [800,800]
  end
  
  version :thumb do
    process :resize_to_fill => [200,200]
  end

end
