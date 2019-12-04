Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
end
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :fruits, only: [:index, :create, :destroy, :update]
    end
  end
end

