class VideosController < ApplicationController
  def index
    @videos = VideosDecorator.new(Video.all)
  end

  def new
    @video = Video.new
  end
end
