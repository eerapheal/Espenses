Rails.application.routes.draw do
  get 'expenses/index'
  get 'expenses/edit'
  get 'expenses/new'
  get 'categories/index'
  get 'categories/edit'
  get 'categories/new'
  root 'home#index'
  devise_for :users
end
