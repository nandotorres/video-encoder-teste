class ZencoderJob < ActiveJob::Base

  # Job para submeter solicitacoes de conversao
  #   para o Zencoder em background
  def perform(video_id)
    video = Video.find(video_id)
    job = ZencoderJobBuilder.new(video)

    begin
      response = Zencoder::Job.create(job.parametros, :timeout => 30_000)

      if response.code == 201
        video.agendado!
      end 
    rescue Timeout::Error, Zencoder::HTTPError
      puts "Erro ao enviar para zencoder"
    end
  end
end