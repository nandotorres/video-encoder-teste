class VideosDecorator < Draper::CollectionDecorator
  def lista_vazia?
    object.empty?
  end

  def lista
    object.decorate
  end
end
