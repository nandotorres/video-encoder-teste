class VideoUploader < CarrierWave::Uploader::Base
  def store_dir
    "originals/#{model.id}"
  end

  def extension_white_list
    %w(mp4 ogg webm)
  end
end
