class VideoDecorator < Draper::Decorator
  delegate_all

  def data_legivel
    object.created_at.strftime('%d-%b %H:%M')
  end
end
