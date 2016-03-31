class VideosDecorator < Draper::Decorator
  def lista_vazia?
    object.empty?
  end

  def lista
    object
  end
end
