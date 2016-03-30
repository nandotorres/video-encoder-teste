class VideoUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "originals/#{model.id}"
  end

  def extension_white_list
    %w(mp4 ogg webm)
  end
end
