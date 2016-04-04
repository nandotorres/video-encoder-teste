# Uma classe para construir jobs para o Zencoder
class ZencoderJobBuilder
  def initialize(video)
    @video = video
  end

  def parametros
    {
      input: @video.arquivo_original.url,
      outputs: [
        {
          label: "#{@video.nome} (MP4)",
          url: "s3://videoconverterteste/#{Rails.env}/convertidos/#{@video.id}/#{@video.nome_sem_extensao}.mp4",
          h264_profile: 'high',
          public: true
        }
      ]
    }
  end
end