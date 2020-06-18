Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :users, only:[:show, :edit, :update]
  resources :posts, only:[:index, :show, :new, :create] do
    resources :post_responses, only: [:create]
  end
  resources :categories, only:[:new, :create]
end
