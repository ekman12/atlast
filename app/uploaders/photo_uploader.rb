class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true

  version :homepage do
    cloudinary_transformation quality: 'auto', fetch_format: :auto
  end

  version :standard do
    process resize_to_fit: [700, 700]
    cloudinary_transformation quality: 'auto', fetch_format: :auto
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:10", radius: 20,
    width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
