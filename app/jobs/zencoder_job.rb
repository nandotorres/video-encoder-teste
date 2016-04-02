class ZencoderJob < ActiveJob::Base
  queue_as :default

  # Job para submeter solicitacoes de conversao
  #   para o Zencoder em background
  def perform(video_id)
    video = Video.find(video_id)
    job = ZencoderJobBuilder.new(video)

    begin
      response = Zencoder::Job.create(job.parametros, :timeout => 30_000)
      if response.code.to_i == 201
        video.job_id = response.body['id']
        video.agendado
        video.save
      end 
    rescue Timeout::Error, Zencoder::HTTPError
      # Caso algum problema aconteca, agenda uma nova tentativa
      ZencoderJob.set(wait: 10.seconds).perform_later(video_id)
    end
  end
end