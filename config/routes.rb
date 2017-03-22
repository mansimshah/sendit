require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'
  mount Sidekiq::Monitor::Engine => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "transfers#new"
  resources :transfers

end