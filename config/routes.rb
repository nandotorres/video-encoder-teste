Rails.application.routes.draw do 
  root 'home#index'

  resources :videos
end
