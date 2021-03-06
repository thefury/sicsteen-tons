Rails.application.routes.draw do

  get 'site/operator'

  root 'site#client'

  namespace :api do
    namespace :v1 do
      resources :requests, only: [:create]
      resources :floors, only: [:index, :destroy]
    end
  end
end
