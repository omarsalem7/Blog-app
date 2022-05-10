Rails.application.routes.draw do
  get 'posts/posts'
  get 'home/home'
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
