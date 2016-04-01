class VideoScheduler
  attr_accessor :video
  
  def initialize(video)
    @video = video
  end
  
  def create
    if self.video.save
      ZencoderJob.perform_later self.video.id
    end
  end
end