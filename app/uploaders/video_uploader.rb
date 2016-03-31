class VideoUploader < CarrierWave::Uploader::Base
  def store_dir
    "originals/#{model.id}"
  end

  def extension_white_list
    %w(3gp avi mpeg mp4 wmv webm flv ogg ogv oga ogx ogm spx opus)
  end
end
