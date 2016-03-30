FactoryGirl.define do
  factory :video do
    transient do
      extensao 'mp4'
    end

    arquivo_original { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,
     "/spec/support/fixtures/files/video_teste.#{extensao}"))) }
  end
end
