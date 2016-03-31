class VideosController < ApplicationController
  def index
    @videos = VideosDecorator.new(Video.all)
  end
end
