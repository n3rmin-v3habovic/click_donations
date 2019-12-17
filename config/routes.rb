Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  root to: 'home#index'

  devise_for :users
end
