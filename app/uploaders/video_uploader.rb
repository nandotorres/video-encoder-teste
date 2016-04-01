class VideoUploader < CarrierWave::Uploader::Base
  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  def store_dir
    "originais/#{model.id}"
  end

  def extension_white_list
    %w(3gp avi mpeg mp4 wmv webm mov flv ogg ogv oga ogx ogm spx opus)
  end

  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
  end  
end
