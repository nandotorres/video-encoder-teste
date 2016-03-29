class Video < ActiveRecord::Base
  validates_presence_of :arquivo_original
end
