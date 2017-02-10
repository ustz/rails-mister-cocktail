class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'jpg'
  # process optimize: [{ quality: 50 }]

end
