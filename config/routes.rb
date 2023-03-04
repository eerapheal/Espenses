Rails.application.routes.draw do

  devise_for :users
  
  root to: 'home#index'

  resources :categories, only: %i[index new create edit update destroy] do
    resources :expenses, only: %i[index new create edit update destroy]
  end
end
