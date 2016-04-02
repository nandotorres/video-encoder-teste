class VideoDecorator < Draper::Decorator
  delegate_all

  def possui_erros?
    object.errors.present?
  end

  def data_legivel
    object.created_at.strftime('%d-%b %H:%M')
  end
end
