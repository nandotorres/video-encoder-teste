module ApplicationHelper

  # Agrupa classes de manipulacao de UI
  module UI

    # Representa um item de menu
    class MenuItem
      attr_accessor :url, :tag, :ativo, :titulo

      def initialize(params)
        @url = params[:url]
        @tag = params[:tag]
        @ativo = params[:ativo]
        @titulo = params[:titulo]
      end

      def css_class
        classes = ['mdl-layout__tab']
        classes << 'is-active' if self.ativo
        classes.join(' ')
      end
    end

    # Representa um menu, composto por varios itens de menu
    #  Estaticamente cria os dois unicos itens: Home e Videos
    class Menu
      delegate :url_helpers, to: 'Rails.application.routes'

      def initialize(item_ativo = :home)
        @item_ativo = item_ativo
      end

      def item_ativo?(tag)
        @item_ativo == tag
      end

      def items
        build_items.each do |item|
          item.ativo = item_ativo?(item.tag)
        end
      end 

      def build_items
        [MenuItem.new({
            titulo: 'Visão Geral',
            tag: :home,
            url: url_helpers.root_path,
            ativo: false
          }),
          MenuItem.new({
            titulo: 'Vídeos',
            tag: :videos,
            url: url_helpers.videos_path,
            ativo: false         
          })
        ]
      end      
    end

    # Exibe mensagens temporarias na UI
    class Flash
      attr_accessor :msg

      def initialize(msg = nil)
        @msg = msg
      end

      def show
        return if self.msg.nil?

        html = <<-eos
          <div class="alert-info">#{self.msg}</div>
        eos
        html.html_safe
      end
    end
  end
end
