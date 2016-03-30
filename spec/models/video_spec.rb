require 'spec_helper'

RSpec.describe Video, type: :model do
  before {
   @video = Video.create({
      :arquivo_original => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/fixtures/files/video_teste.mp4')))
    })

   @bucket = "https://video-converter-teste.s3.amazonaws.com/testes/originals/"
  }

  subject { @video }

  it { should be_valid }

  describe "#upload" do

    it "deve ter enviado um arquivo para o AWS S3" do
      assert_match "#{@bucket}#{@video.id}/#{@video.arquivo_original_identifier}", @video.arquivo_original.url
    end

    it "deve bloquear arquivos de content-type nao permitidos" do
      video = Video.create({
        :arquivo_original => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/fixtures/files/video_teste.avi')))
      })

      expect(video).not_to be_valid
      video.remove_arquivo_original!
    end

  end

  after {
    @video.remove_arquivo_original!
  }

end