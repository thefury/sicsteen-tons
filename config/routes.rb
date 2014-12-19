Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'floors/index'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'floors/destroy'
    end
  end

  get 'site/operator'

  root 'site#client'

  namespace :api do
    namespace :v1 do
      resources :requests, only: [:create]
      resources :floors, only: [:index, :destroy]
    end
  end
end
