class VideosController < ApplicationController
  def index
    @videos = VideosDecorator.new(Video.all)
  end

  def new
    @video = Video.new.decorate
  end

  def create
    @video = Video.new(parametros)
    @video_scheduler = VideoScheduler.new(@video)
  
    if @video_scheduler.create
      redirect_to videos_path, notice: 'O seu vídeo foi enviado para conversão'
    else
      @video = @video_scheduler.video.decorate
      render action: :new
    end
  end

  def show
    @video = Video.find(params[:id]).decorate

    rescue ActiveRecord::RecordNotFound
      render :file => 'public/404.html', :status => :not_found
  end

  private
    def parametros
      params.fetch(:video, {}).permit(:arquivo_original)
    end
end
