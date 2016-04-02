source 'https://rubygems.org'

gem 'rails', '4.2.6'

gem 'mysql2', '0.3.20'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'

# Para gerenciar uploads
gem 'carrierwave'
gem 'fog'
gem 'fog-aws'

gem 'simple_form'

# Para integracao com o Zencoder
gem 'zencoder', '~> 2.0'
gem 'sidekiq'
gem 'sidetiq'
gem 'sinatra', require: false
gem 'slim'
gem 'state_machine'

# Para decorar as views
gem 'draper', '~> 1.3'

# Gerenciar requisicoes HTTP para o Rails
gem 'puma'

# Gerenciar variaveis de ambiente
gem 'figaro'

group :development, :test do
  gem 'byebug'
end

group :development do
    gem 'capistrano',         require: false
    gem 'capistrano-rvm',     require: false
    gem 'capistrano-rails',   require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma',   require: false
    gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
    gem 'capistrano-figaro-yml', '~> 1.0.2'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'  
  gem 'shoulda-matchers'
  gem 'rspec-collection_matchers'
end

