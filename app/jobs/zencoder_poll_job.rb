class ZencoderPollJob
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { secondly(10) }

  def perform
    transcoding = VideosDecorator.new(Video.transcoding)
    puts "Consultando status de #{transcoding.size} Jobs" unless transcoding.lista_vazia?

    transcoding.lista.each do |video|
      puts "Job id #{video.job_id}"      
      response = Zencoder::Job.details(video.job_id)
      if response.code.to_i == 200
        body = response.body
        job = body['job']
        state = job['state']

        case state
        when "finished" then
          output = job['output_media_files'][0]
          video.concluido
          video.arquivo_convertido = output['url']
          video.duracao = output['duration_in_ms']
          video.tamanho_bytes = output['file_size_bytes']
          video.largura = output['width']
          video.altura = output['height']
          video.save
        when "failed"
          video.falhou!
        end
      end
    end
  end
end