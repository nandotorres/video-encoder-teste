require 'spec_helper'

RSpec.describe Video, type: :model do
  before {
   @video = FactoryGirl.build :video, :extensao => 'mp4'
   @bucket = "/testes/originals/"
  }

  subject { @video }

  it { should be_valid }

  describe "#criar video" do
    it "deve ter gerado um arquivo em disco (em ambiente de testes)" do
      video_valido = FactoryGirl.create :video, :extensao => 'mp4'
      assert_match "#{@bucket}#{video_valido.id}/#{video_valido.arquivo_original_identifier}",
       video_valido.arquivo_original.url, 'Nao gerou o arquivo onde se esperava'
    end

    it "deve bloquear arquivos de content-type nao permitidos" do
      video_invalido = FactoryGirl.build :video, :extensao => 'txt'
      expect(video_invalido).not_to be_valid, 'Permitiu uma extensao invalida'
    end
  end
end