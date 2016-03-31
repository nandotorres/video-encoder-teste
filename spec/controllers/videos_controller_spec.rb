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
      expect(assigns(:video).class).to eq(Video.new.class)
    end
  end
end
