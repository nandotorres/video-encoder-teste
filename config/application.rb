require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module VideoEncoderTeste
  class Application < Rails::Application

    # Nao gera specs para views e helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end
    
    config.autoload_paths += %W(\#{config.root}/lib)

    config.active_record.raise_in_transactional_callbacks = true
  end
end
