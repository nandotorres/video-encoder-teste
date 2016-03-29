require 'spec_helper'

RSpec.describe Video, type: :model do
  before { @video = Video.create({
    :arquivo_original => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/fixtures/files/video_teste.mp4')))
    })
  }

  subject { @video }

  it { should validate_presence_of(:arquivo_original) }

end