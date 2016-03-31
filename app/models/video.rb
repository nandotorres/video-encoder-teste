class Video < ActiveRecord::Base
  default_scope { order("created_at DESC") }

  validates_presence_of :arquivo_original

  mount_uploader :arquivo_original, VideoUploader
end
