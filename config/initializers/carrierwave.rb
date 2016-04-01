CarrierWave.configure do |config|

  if Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
  end

  # Configura para enviar arquivo para o S3
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                'sa-east-1',
  }
  
  config.fog_directory  = 'video-converter-teste'
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}    


  # make sure our uploader is auto-loaded
  VideoUploader

  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/support/uploads/tmp"
      end

      def store_dir
        "originais/#{model.id}"
      end
    end
  end
end