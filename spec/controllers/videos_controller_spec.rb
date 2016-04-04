require 'spec_helper'

RSpec.describe VideosController, type: :controller do
  render_views 

  describe "GET #index" do
    it "deve alcancar a acao index" do
      get :index
      assert_response :success, 'Nao retornou uma resposta com sucesso'
    end

    it "quando nao houver videos, carregar a view lista_vazia " do
      get :index
      expect(response).to render_template(partial: '_lista_vazia')
    end

    it "quando houver videos, lista-los com o decorator e partial apropriados" do
      video = FactoryGirl.create :video, :extensao => 'mp4'
      get :index
      expect(assigns(:videos)).to be_decorated_with VideosDecorator
      expect(response).to render_template(partial: '_video')
    end    
  end

  describe "GET #new" do
    it "deve carregar um formulario para upload de video" do 
      get :new
      expect(response).to render_template(partial: '_form')
      expect(assigns(:video).class).to eq(VideoDecorator.new(Video.new).class)
    end
  end

  describe "POST #create" do
    include ActiveJob::TestHelper
    
    it "deve criar um novo video e fazer o upload do arquivo" do 
      post :create, video: FactoryGirl.attributes_for(:video, :extensao => 'mp4')
      expect(enqueued_jobs.size).to eq(1) 
      expect(response).to redirect_to videos_url
    end

    it "deve exibir uma mensagem de erro ao enviar arquivos invalidos" do 
      post :create, video: FactoryGirl.attributes_for(:video, :extensao => 'txt')
      expect(response.body).to match /Não é permitido o envio de arquivos/im
    end
  end

  describe "GET #show" do 
    it "deve exibir uma página com status 404 ao tentar um ID inexistente" do
      get :show, id: 1000
      expect(response.status).to eq(404)
      expect(response.body).to match /P.gina n.o encontrada/im
    end

    it "deve exibir o adequado com o status do video" do
      video = FactoryGirl.create :video, :extensao => 'mp4'
      video.agendado!

      get :show, id: video.id
      expect(response).to render_template(partial: '_player_transcoding')

      video.concluido!
      get :show, id: video.id
      expect(response).to render_template(partial: '_player_finished')      
    end
  end
end
