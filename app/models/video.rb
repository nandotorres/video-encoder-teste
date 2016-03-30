class Video < ActiveRecord::Base
  validates_presence_of :arquivo_original

  mount_uploader :arquivo_original, VideoUploader
end
