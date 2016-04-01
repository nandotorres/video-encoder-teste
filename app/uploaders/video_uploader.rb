class VideoUploader < CarrierWave::Uploader::Base
  def store_dir
    "originais/#{model.id}"
  end

  def extension_white_list
    %w(3gp avi mpeg mp4 wmv webm mov flv ogg ogv oga ogx ogm spx opus)
  end
end
