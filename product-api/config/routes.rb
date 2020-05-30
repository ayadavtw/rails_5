Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      #post 'products/import' => 'products#import'
      resources :products do
        get :avatar, on: :member
        post :import, on: :collection
      end
    end
  end
end