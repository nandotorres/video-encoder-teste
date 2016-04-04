class VideoDecorator < Draper::Decorator
  delegate_all

  def largura
    [780, object.largura || 780].min
  end

  def altura
    [440, object.altura || 440].min    
  end

  def tamanho_legivel
    if tamanho = object.tamanho_bytes
      "#{tamanho / 1024} Kbytes"
    else
      "Indisponível"
    end
  end

  def duracao_legivel
    if duracao = object.duracao
      "#{duracao / 1000} segundos"
    else
      "Indisponível"
    end
  end  

  def possui_erros?
    object.errors.present?
  end

  def data_legivel
    object.created_at.strftime('%d-%b %H:%M')
  end
end
